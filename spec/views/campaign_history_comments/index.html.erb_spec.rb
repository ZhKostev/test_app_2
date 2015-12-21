require 'rails_helper'

RSpec.describe "campaign_history_comments/index", type: :view do
  before(:each) do
    assign(:campaign_history_comments, [
      CampaignHistoryComment.create!(),
      CampaignHistoryComment.create!()
    ])
  end

  it "renders a list of campaign_history_comments" do
    render
  end
end
