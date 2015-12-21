require 'rails_helper'

RSpec.describe "campaign_history_comments/edit", type: :view do
  before(:each) do
    @campaign_history_comment = assign(:campaign_history_comment, CampaignHistoryComment.create!())
  end

  it "renders the edit campaign_history_comment form" do
    render

    assert_select "form[action=?][method=?]", campaign_history_comment_path(@campaign_history_comment), "post" do
    end
  end
end
