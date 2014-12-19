class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :user_games
  has_many :games, :through => :user_games

  def self.authenticate(email,password)
    user = User.where(email: email).first

    if user.password == password
      user
    else
      nil
    end
  end

end
