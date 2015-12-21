require 'rails_helper'

RSpec.describe "campaign_history_comments/show", type: :view do
  before(:each) do
    @campaign_history_comment = assign(:campaign_history_comment, CampaignHistoryComment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
