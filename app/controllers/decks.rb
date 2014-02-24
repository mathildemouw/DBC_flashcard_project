get '/select_deck' do
  redirect '/users/login' unless logged_in?
  @decks = Deck.all
  erb :select_deck
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @card = @cards.sample
  @deck.scores.find_by_user_id(current_user.id) || Score.create!(user_id: current_user.id, deck_id: @deck.id)
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
  @alert = AlertCreator.create(:answer, @card, params)
  if @alert.result == 'right'
    @score = current_user.scores.find_by_deck_id(params[:deck_id])
    @score.correct_answers += 1
    @score.save!
  end
  redirect "/deck/#{params[:deck_id]}/cards/#{@card.id.to_s + '?alert=' + @alert.message if @alert.message}"
end