def right_answer?(card, answer)
  return card.answer == answer
end

get '/' do

  erb :index
end


# get '/play' do
#   @cards = Card.all
#   erb :play
# end