get '/cards/:id' do
  redirect '/users/login' unless logged_in?
  @card = Card.find(params[:id])
  @alert = AlertCreator.translate(params[:alert], '<br />')

  erb :cards
end

post '/cards/:id' do
  @card = Card.find(params[:id])
  @alert = AlertCreator.create(:answer, @card, params).message
  redirect "/cards/#{@card.id.to_s + '?alert=' + @alert if @alert}"
end


  if params[:answer].nil?
    @alert = params[:alert]

  elsif params[:answer] == @card.answer
    @alert = "You are right"
    @card = @card.deck.cards.sample
    current_deck = @card.deck
    @score = current_user.scores.find_by_deck_id(current_deck.id)
    @score.correct_answers += 1
    @score.save!

    redirect "/cards/#{@card.id}?alert=#{@alert}"

  else
    @alert = "#{params[:answer]} is incorrect. Shame on you and your family."
  end

  erb :cards
end
