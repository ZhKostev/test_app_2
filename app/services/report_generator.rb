class ReportGenerator
  attr_accessor :params, :errors
  def initialize(params)
    @params = params
    @errors = []
  end

  def generate
    if report_can_be_generated?
      fetch_data_from_api
      errors.empty?
    else
      false
    end
  end

  def campaign
    external_api.campaign
  end

  private

  def report_can_be_generated?
    errors << 'Campaign ID should present' if params[:campaign_id].blank?

    errors.empty?
  end

  def fetch_data_from_api
    if external_api.get_campaign_data
      log_history
    else
      @errors += external_api.errors
    end
  end

  def external_api
    @external_api ||= ExternalAPI.new(params[:campaign_id])
  end

  def log_history
    CampaignHistoryComment.create!(
      :campaign_id => Campaign.where(:campaign_id => params[:campaign_id]).last.id,
      :api_campaign_id => params[:campaign_id]
    )
  end
end