get '/notifications/:notification_id/delete' do
 notification = Notification.find(params[:notification_id]).delete
 redirect '/dashboard'
end