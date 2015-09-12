class Player < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
