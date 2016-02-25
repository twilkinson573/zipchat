class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = @conversation.messages.all
    update_read_status unless @messages.empty?

    @message = @conversation.messages.new
  end

  def create
    @message = Message.new(message_params)
    @message.conversation_id = @conversation.id
    if @message.save!
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def update_read_status
    @messages.last.read = true if @messages.last.user_id != current_user.id
  end
end