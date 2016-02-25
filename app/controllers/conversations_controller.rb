class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.where('sender_id= ? OR recipient_id= ?', current_user.id, current_user.id)
    @users = User.all
  end
  
  def create
    @conversation = set_or_create_conversation(params[:sender_id], params[:recipient_id])
    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id)
  end

  def set_or_create_conversation(sender_id, recipient_id)
    Conversation.between(sender_id, recipient_id).first ||= Conversation.create!(conversation_params)
  end

end