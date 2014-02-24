helpers do
  def logged_in?
    true unless session[:id].nil?
  end

  def log_in(id)
    session[:id] = id
  end
end