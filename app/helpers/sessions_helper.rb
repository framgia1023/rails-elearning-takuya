module SessionsHelper
  
  def current_user
    User.find_by(id: session[:user_id])
    #User.find(session[:user_id]) = error
    #user.find_by(id: session[:user_id]) = nil
  end

  def logged_in?
    #NOT operater == != !
    !current_user.nil?
  end

  def current_user?(user)
    current_user == user
  end


end
