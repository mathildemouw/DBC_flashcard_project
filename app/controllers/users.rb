require 'pry'

get '/users/new' do

  erb :signup
end

post '/users' do
  User.create(name: params[:name], email: params[:email], password: params[:password])
  redirect '/'
end

get '/users/login' do
  erb :login
end

post '/users/login' do
  @user = User.find_by_name(params[:name])
  redirect '/users/login' unless @user
  params[:password] == @user.password if session[:id] = @user.id

  redirect '/'
end

post '/users/logout' do
  session.clear
  redirect '/'
end