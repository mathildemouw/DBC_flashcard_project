helpers do
  def logged_in?
    true unless session[:id].nil?
  end
end