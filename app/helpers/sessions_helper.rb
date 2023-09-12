module SessionsHelper
  def current_director
    @current_director ||= Director.find_by(id: session[:director_id])
  end

  def logged_in?
    !current_director.nil?
  end
end
