require "rails_helper"

RSpec.describe CampaignHistoryCommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/campaign_history_comments").to route_to("campaign_history_comments#index")
    end

    it "routes to #show" do
      expect(:get => "/campaign_history_comments/1").to route_to("campaign_history_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/campaign_history_comments/1/edit").to route_to("campaign_history_comments#edit", :id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/campaign_history_comments/1").to route_to("campaign_history_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/campaign_history_comments/1").to route_to("campaign_history_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/campaign_history_comments/1").to route_to("campaign_history_comments#destroy", :id => "1")
    end
  end
end
