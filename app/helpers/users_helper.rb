module UsersHelper
  def authenticated?
    return !session[:user_id].nil?
  end

  def current_user
    return User.find_by_id(session[:user_id]) if authenticated?
  end
end
