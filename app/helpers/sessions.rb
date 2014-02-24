helpers do
  def logged_in?
    true unless session[:id].nil?
  end

  def log_in(id)
    session[:id] = id
  end

  def current_user
    User.find(session[:id])
  end

  # def current_deck
  # end
end