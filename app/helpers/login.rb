helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def are_they_friends?(user_1, user_2)
    @friend_object = Friend.where(:user_1 => user_1, :user_2 => user_2)
    if @friend_object
      return true
    else
      return false
    end
  end
end