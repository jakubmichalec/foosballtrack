class Player < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
