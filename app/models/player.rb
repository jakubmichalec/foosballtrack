class Player < ActiveRecord::Base
  has_many :home_score, foreign_key: :home_player_id, class_name: 'Match'
  has_many :away_score, foreign_key: :away_player_id, class_name: 'Match'

  validates_presence_of :first_name, :last_name
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
