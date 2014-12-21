class CreateUserGames < ActiveRecord::Migration
  def change
    create_table :user_games do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.boolean :my_turn, :default => false
      t.timestamps
    end
  end
end

