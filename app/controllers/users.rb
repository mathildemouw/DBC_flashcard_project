require 'pry'

get '/users/new' do
  @alert = AlertCreator.translate(params[:alert], '<br />')
  erb :signup
end

post '/users' do
  @user = User.create(params)
  @alert = AlertCreator.create(:create_user, @user, params).message

  redirect "/#{ 'users/new?alert=' + @alert if @alert}"
end

get '/users/login' do
  @alert = AlertCreator.translate(params[:alert], '<br />')
  erb :login
end

post '/users/login' do
  @user = User.find_by_name(params[:name])
  redirect '/users/login' if @user.nil?

  @alert = AlertCreator.create(:login, @user, params).message
  session[:id] = @user.id unless @alert
  redirect "/#{ 'users/login?alert=' + @alert if @alert }"
end

post '/users/logout' do
  session.clear
  redirect '/'
end