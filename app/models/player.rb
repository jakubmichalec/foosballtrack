class Player < ActiveRecord::Base
  has_many :home_score, foreign_key: :home_player_id, class_name: 'Match'
  has_many :away_score, foreign_key: :away_player_id, class_name: 'Match'

  validates_presence_of :first_name, :last_name
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  def home_player_match
    Match.where("home_player_id = ?", self.id)
  end

  def away_player_match
    Match.where("away_player_id = ?", self.id)
  end

  def home_score_sum
    home_player_match.sum(:home_score)
  end

  def away_score_sum
    away_player_match.sum(:away_score)
  end

  def number_of_matches
    Match.where("away_player_id = ? OR home_player_id = ?", self.id, self.id).count
  end

  def winner
      Match.where("(away_player_id = ? AND away_score = ?) OR
      (home_player_id = ? AND home_score = ?)", self.id, 10, self.id, 10)
  end

  def wins
    winner.count
  end

  def lost_game
    Match.where("(away_player_id = ? AND away_score BETWEEN ? and ?) OR
    (home_player_id = ? AND home_score BETWEEN ? and ?)",
    self.id, 1, 9, self.id, 1, 9)
  end

  def lose
    lost_game.count
  end

  def goals
    home_score_sum + away_score_sum
  end

  def lost_goals
    home_player_match.sum(:away_score) + away_player_match.sum(:home_score)
  end
end
