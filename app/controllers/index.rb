get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/users/new' do

  erb :signup
end

post '/users/new' do
  User.create(name: params[:name], email: params[:email], password: params[:password])
  redirect '/'
end

get '/users/login' do

  erb :login
end

post '/users/login' do
end

get '/select_deck' do
  erb :select_deck
end

get '/play/deck:id' do
end