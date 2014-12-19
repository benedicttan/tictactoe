class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :boxes
  has_many :user_games
  has_many :users, :through => :user_games

  def new_move(box_id, player_id)
    # byebug
    this_box = self.boxes.order(:id)[box_id.to_i-1]
    # this_box = self.boxes[1]
    this_box.player_id = player_id.to_i
    this_box.save
  end
end
