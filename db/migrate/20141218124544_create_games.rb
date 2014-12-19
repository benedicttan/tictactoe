class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.boolean :ended, :default => false
      t.boolean :in_progress, :default => false
      t.timestamps
    end
  end
end
