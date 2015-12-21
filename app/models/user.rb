class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :authentication_keys => [:username]

  validates :username, :presence => true, :uniqueness => true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
