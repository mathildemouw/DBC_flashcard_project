get '/cards/:id' do
  redirect '/users/login' unless logged_in?
  @card = Card.find(params[:id])
  @alert = AlertCreator.translate(params[:alert], '<br />')

  erb :cards
end

post '/cards/:id' do
  @card = Card.find(params[:id])
end
