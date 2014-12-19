class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.belongs_to :game
      t.integer :player_id # 1 or 2, not User.id
      t.timestamps
    end
  end
end
