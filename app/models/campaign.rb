class Campaign < ActiveRecord::Base
  has_many :creatives, :dependent => :destroy
end
