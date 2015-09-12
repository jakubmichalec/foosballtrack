class AddIndexToPlayersNickname < ActiveRecord::Migration
  def change
    add_index :players, :nickname, unique: true
  end
end
