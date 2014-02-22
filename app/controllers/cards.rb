get '/cards' do
  id = Card.all.sample.id
  redirect "/cards/#{id}"
end

get '/cards/:id' do
  redirect '/users/login' unless logged_in?
  @card = Card.find(params[:id])

  if params[:answer].nil?
    @alert = params[:alert]

  elsif params[:answer] == @card.answer
    @alert = "You are right"
    @card = Card.all.sample
    redirect "/cards/#{@card.id}?alert=#{@alert}"

  else
    @alert = "#{params[:answer]} is incorrect. Shame on you and your family."
  end

  erb :cards
end
