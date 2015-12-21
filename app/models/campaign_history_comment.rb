class CampaignHistoryComment < ActiveRecord::Base
  validates :comment, :length => { :maximum => 160 }
  belongs_to :campaign
end
