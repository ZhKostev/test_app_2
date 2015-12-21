require 'rails_helper'

RSpec.describe "CampaignHistoryComments", type: :request do
  describe "GET /campaign_history_comments" do
    it "works! (now write some real specs)" do
      get campaign_history_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
