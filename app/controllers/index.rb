def right_answer?(card, answer)
  return card.answer == answer
end

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
  user = User.find_by_name(params[:name])
  session[:id] = user.id
end

get '/select_deck' do

  # @decks = Card.all
  erb :select_deck
end

# get '/play/deck/id:id' do
#   @cards = Card.all
#   erb :play
# end

get '/play' do
  @cards = Card.all
  erb :play
end

get '/right_or_wrong' do
#this doesn't work
#becuase we can't keep the card that they're guessing;
#we only have answer saved, not card

  @card = something
  @answer = params[:answer]
  erb :right_or_wrong
end
