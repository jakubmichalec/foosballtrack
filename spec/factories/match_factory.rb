FactoryGirl.define do
  factory :match do
    sequence(:match_date) { |n| Date.today - n }
    home_player_id 1
    home_score 10
    away_score 9
    away_player_id 2
  end
end
