get '/newgame' do
  new_game = Game.create
  session[:user_game] = UserGame.create(game_id: new_game.id, user_id: session[:user].id, my_turn: true)

  i = 1
  9.times do
    Box.create(game_id: new_game.id)
    i += 1
  end

  session[:game_id] = new_game.id
  redirect to "/lobby"
end

get '/joingame/:id' do
  session[:user_game] = UserGame.create(game_id: params[:id], user_id: session[:user].id, my_turn: false)
  new_game = Game.find(params[:id])
  new_game.in_progress = true
  new_game.save
  session[:game_id] = params[:id]
  redirect to "/game"
end

get '/check_status/:id' do
  if Game.find(params[:id]).in_progress == true
    return "true"
  else
    return "false"
  end
end

get '/game' do
  erb :game
end

get '/lobby' do
  erb :lobby
end

get '/new_move' do
  # byebug

  box_id = params["box_id"]
  player_id = params["player_id"]
  this_game = Game.find(session[:game_id])
  this_game.new_move(box_id,player_id)
  # byebug
  players = UserGame.where(game_id: session[:game_id])

  players.each do |p| # swap turns
    if p.my_turn == false
      p.my_turn = true
    else
      p.my_turn = false
    end

    p.save
  end

  return ""

end

get '/check_turn' do
  if UserGame.where(user_id: session[:user].id, game_id: session[:game_id])[0].my_turn
    erb :game
  else
    return ""
  end
end