class MessagesController < ApplicationController

  def show
    #binding.pry
    @user = User.find(params[:id])
    @message = Message.new
    @messages = @user.messages.all

  end

  def create
    #binding.pry
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(message_params)
      if @message.save
        flash[:success] = "メッセージを送りました"


        redirect_to "/rooms/#{@message.room_id}"
      else
        flash[:danger] = "送信に失敗しました"
        render 'show'
      end

    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
  end

  private

    def message_params
      params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id)
    end

end
