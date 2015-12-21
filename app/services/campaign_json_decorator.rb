class CampaignJsonDecorator
  attr_reader :campaign
  def initialize(campaign)
    @campaign = campaign
  end

  #some decoration can be implemented here
  def info
    {
      :campaign_name => campaign.name,
      :start_date => campaign.start_date,
      :end_date => campaign.end_date,
      :media_budget => campaign.media_budget,
      :media_spent => campaign.media_spent,
      :impressions => campaign.impressions,
      :ctr => campaign.ctr,
      :conversions => campaign.conversions,
      :ecpm => campaign.ecpm,
      :ecpc => campaign.ecpc,
      :ecpa => campaign.ecpa
    }
  end
end