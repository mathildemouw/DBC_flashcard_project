get '/select_deck' do
  redirect '/users/login' unless logged_in?
  @decks = Deck.all
  erb :select_deck
end

get '/deck/:deck_id' do
  @cards = Deck.find(params[:deck_id]).cards
  @card = @cards.sample
  redirect to "/deck/#{params[:deck_id]}/cards/"
end

get '/deck/:deck_id/cards/?' do
  redirect '/users/login' unless logged_in?
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.sample
  @alert = AlertCreator.translate(params[:alert], '<br />')
  erb :cards
end

get '/deck/:deck_id/cards/:id' do
  redirect '/users/login' unless logged_in?
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:id])
  @alert = AlertCreator.translate(params[:alert], '<br />')

  erb :cards
end

post '/deck/:deck_id/cards/:id' do
  redirect "/deck/#{params[:deck_id]}/cards" if params[:next]
  @card = Card.find(params[:id])
  @alert = AlertCreator.create(:answer, @card, params).message
  redirect "/deck/#{params[:deck_id]}/cards/#{@card.id.to_s + '?alert=' + @alert if @alert}"
end