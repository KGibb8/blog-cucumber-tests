# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def like(message)
    ActionCable.server.broadcast("post_channel", message: message)
  end

  def comment
  end
end
