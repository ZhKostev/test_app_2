class Api::CampaignHistoryCommentsController < Api::BaseController
  def index
    render :json => index_json_data
  end

  private

  def index_json_data
    CampaignHistoryComment.all.map do |com|
      { :datetime => com.created_at, :campain_id => com.api_campaign_id, :comment => com.comment }
    end
  end
end
