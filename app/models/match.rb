class Match < ActiveRecord::Base
  belongs_to :home_player, class_name: 'Player'
  belongs_to :away_player, class_name: 'Player'

  validates_presence_of :match_date, :home_player_id, :home_score, :away_score,
                        :away_player_id

end
