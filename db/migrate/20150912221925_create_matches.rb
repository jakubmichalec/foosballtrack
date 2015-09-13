class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :match_date
      t.references :home_player, index: true, foreign_key: true
      t.references :away_player, index: true, foreign_key: true
      t.integer :home_score
      t.integer :away_score

      t.timestamps null: false
    end
  end
end
