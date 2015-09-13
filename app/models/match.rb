class Match < ActiveRecord::Base
  belongs_to :home_player, class_name: 'Player'
  belongs_to :away_player, class_name: 'Player'

  validates_presence_of :match_date, :home_player_id, :home_score, :away_score,
                        :away_player_id
  validate :home_and_away_player, :future_date, :proper_score, :not_enough_goals

  def home_and_away_player
    errors.add(:base, "Home and Away player can't be the same") unless self.home_player_id != self.away_player_id
  end

  def future_date
    errors.add(:base, "Match Date can't be in the future") if
      self.match_date && self.match_date > Date.today
  end

  def proper_score
    errors.add(:base, "Only one player can have 10 goals") if
      self.away_score == 10 && self.home_score == 10
  end

  def not_enough_goals
    errors.add(:base, "One player must have 10 Goals") if
      (self.away_score && self.away_score < 10) && (self.home_score && self.home_score < 10)
  end
end
