helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def are_they_friends?(id_1, id_2)
    friends = false
    @user = User.find(id_1)
    @user.friends.each do |friend|
      if friend.id == id_2
        friends = true
      end
    end
    friends
  end
end