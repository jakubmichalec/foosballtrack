class Match < ActiveRecord::Base
  belongs_to :home_player, class_name: 'Player'
  belongs_to :away_player, class_name: 'Player'

  validates_presence_of :match_date, :home_player_id, :home_score, :away_score,
                        :away_player_id

  def home_score_sum
    matches.where("home_player_id = ?", player.id).sum(:home_score)
  end

  def away_score_sum
    matches.where("away_player_id = ?", player.id).sum(:away_score)
  end

  def score
    home_score_sum + away_score_sum
  end
end
