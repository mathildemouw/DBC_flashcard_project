def right_answer?(card, answer)
  return card.answer == answer
end

get '/' do

  erb :index
end

get '/select_deck' do
  redirect '/users/login' unless logged_in?
  erb :select_deck
end

get '/play' do
  @cards = Card.all
  erb :play
end