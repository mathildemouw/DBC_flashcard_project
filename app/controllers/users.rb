require 'pry'

get '/users/new' do
  @alert = AlertCreator.translate(params[:alert], '<br />')
  erb :signup
end

post '/users' do
  User.create(name: params[:name], email: params[:email], password: params[:password])
  redirect '/'
end

get '/users/login' do
  @alert = AlertCreator.translate(params[:alert], '<br />')
  erb :login
end

post '/users/login' do
  @user = User.find_by_name(params[:name])

  if @user.nil?
    redirect '/users/login'
  elsif params[:password] == @user.password
    session[:id] = @user.id
  else
    @alert_query = "?alert=#{AlertCreator.create(:login, {username: @user.name}).message}"
  end

  redirect "/users/login#{@alert_query}"
end

post '/users/logout' do
  session.clear
  redirect '/'
end