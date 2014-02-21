get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/sign_up' do
  #mathilde
end

get '/log_in' do
end

get '/select_deck' do
  erb :select_deck
end

get '/play/deck:id' do
end