class MessagesController < ApplicationController 
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", message: message.body
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end