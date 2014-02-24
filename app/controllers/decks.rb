get '/select_deck' do
  redirect '/users/login' unless logged_in?
  @decks = Deck.all
  erb :select_deck
end

get '/deck/:id' do
  @cards = Deck.find(params[:id]).cards
  @card = @cards.sample
  redirect to "/cards/#{@card.id}"
end