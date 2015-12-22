require 'httparty'
class ExternalAPI
  extend HTTParty
  #For production app should be extracted into secret config
  CREDENTIALS = {
    :user => 'test.api',
    :password => '5DRX-AF-gc4',
    :client_id => 'Test',
    :client_secret => 'xIpXeyMID9WC55en6Nuv0HOO5GNncHjeYW0t5yI5wpPIqEHV'
  }.stringify_keys!.freeze
  API_URL = 'https://testcost.platform161.com/api/v2/'.freeze

  attr_accessor :errors, :campaign
  attr_reader :campaign_id
  def initialize(campaign_id)
    @campaign_id = campaign_id
    @errors = []
  end

  def get_campaign_data
    return true if data_already_in_db?
    access_token = authenticate_user
    return false unless access_token
    campaign_data = main_campaign_data(access_headers(access_token))
    return false unless campaign_data
    campaign_performance_data = campaign_performance_data(access_headers(access_token), campaign_data)
    return false unless campaign_performance_data
    creatives_performance_data = creatives_performance_data(access_headers(access_token), campaign_data)
    return false unless creatives_performance_data
    store_data_in_db(campaign_data, campaign_performance_data, creatives_performance_data)

    errors.empty?
  end

  private

  def data_already_in_db?
    (@campaign ||= Campaign.where(:campaign_id => campaign_id).last).present?
  end

  def authenticate_user
    if response_success?(response = process_request(:post, 'access_tokens/', CREDENTIALS, {}))
      JSON.parse(response.body)['token']
    else
      errors << 'Some errors during authentication. Please check credentials'
      nil
    end
  end

  def main_campaign_data(headers)
    if response_success?(response = process_request(:get, '/campaigns/' + campaign_id.to_s, {}, headers))
      parsed_body = JSON.parse(response.body)
      {
        :name => parsed_body['name'],
        :start_date => parsed_body['start_on'],
        :end_date => parsed_body['end_on'],
        :media_budget => parsed_body['media_budget'],
        :campaign_id => campaign_id.to_i
      }
    else
      errors << 'Some errors during fetching campaign.' + JSON.parse(response.body)['message']
      nil
    end
  end

  def campaign_performance_data(headers, campaign_data)
    response = process_request(:post, 'advertiser_reports/', report_params(campaign_data, :campaign), headers)
    if response_success?(response) && (data = fetch_campaign_report_data(response)).present?
      build_performance_data(data)
    else
      errors << 'Some errors during fetching performance data.' + JSON.parse(response.body)['message'].to_s
      nil
    end
  end

  def creatives_performance_data(headers, campaign_data)
    response = process_request(:post, 'advertiser_reports/', report_params(campaign_data, :creative), headers)
    if response_success?(response)
      JSON.parse(response.body)['results']
    else
      errors << 'Some errors during fetching performance data.' + JSON.parse(response.body)['message'].to_s
      nil
    end
  end

  def build_performance_data(data)
    {
      :media_spent => data['total_campaign_cost'],
      :impressions => data['impressions'],
      :clicks => data['clicks'],
      :ctr => data['ctr'],
      :conversions => data['conversions'],
      :ecpm => data['impressions'].to_i > 0 ? data['gross_revenues'].to_f/data['impressions'].to_i*1000 : 0,
      :ecpc => data['clicks'].to_i > 0 ? data['gross_revenues'].to_f/data['clicks'].to_i : 0,
      :ecpa => data['conversions'].to_i > 0 ? data['gross_revenues'].to_f/data['conversions'].to_i : 0,
    }
  end

  def fetch_campaign_report_data(response)
    parsed_body = JSON.parse(response.body)
    parsed_body['results'].find{ |data| data['campaign_id'] == campaign_id.to_i  }
  end

  def report_params(campaign_data, groupping)
    {
      :advertiser_report => {
        :groupings => [ groupping ],
        :measures   => [:total_campaign_cost, :impressions, :clicks, :ctr, :conversions, :gross_revenues, :net_revenues],
        :date_limit => :range,
        :start_on => campaign_data[:start_date],
        :end_on => campaign_data[:end_date]
      }
    }
  end

  #it can be stored with raw SQL to improve performance
  def store_data_in_db(campaign_data, performance_data, creatives_performance_data)
    Campaign.transaction do
      @campaign = Campaign.create!(campaign_data.merge(performance_data))
      creatives_performance_data.each do |creative_data|
        @campaign.creatives.create!(creative_attrs(creative_data))
      end
    end
  end

  def creative_attrs(creative_data)
    {
      :name => creative_data['creative_name'],
      :api_creative_id => creative_data['creative_id']
    }.merge(build_performance_data(creative_data).except(:media_spent))
  end

  def process_request(request_type, path, params, headers)
    HTTParty.public_send(request_type, API_URL + path, :query => params, :headers => headers)
  end

  def access_headers(access_token)
    { 'PFM161-API-AccessToken' => access_token }
  end

  def response_success?(response)
    response.code.to_i == 200 || response.code.to_i == 201
  end
end
