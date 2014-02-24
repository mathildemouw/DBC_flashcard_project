get '/cards/:id' do
  redirect '/users/login' unless logged_in?
  @card = Card.find(params[:id])
  @alert = AlertCreator.translate(params[:alert], '<br />')

  erb :cards
end

post '/cards/:id' do
  @card = Card.find(params[:id])

  if params[:answer] == @card.answer
    alert_params[:result] = :right
    @alert = AlertCreator.create(:answer, alert_params).message
    @card = Card.all.sample
  # Else, make a new alert to say it is incorrect.
  else
    alert_params[:result] = :wrong
    @alert = AlertCreator.create(:answer, alert_params).message
  end
  redirect "/cards/#{@card.id}?alert=#{@alert}"
end
