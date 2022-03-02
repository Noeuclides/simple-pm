class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for "web_notifications_channel"
  end
end
