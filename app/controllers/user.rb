set :protection, except: :session_hijacking

post '/signup' do
  # session[:error] = nil
  user = User.create(params[:user])
  @message = "Signed up. Please login below."
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:login]["email"], params[:login]["password"])

  if @user
    session[:user] = @user
    erb :index
  else
    @message = "User not authenticated"
    erb :index
  end
end

post '/logout' do
  session[:user] = nil
  redirect to ('/')
end