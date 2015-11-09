class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # POST /messages
  # POST /messages.json
  # def create
  #   @message = Message.new(message_params)
  #   authorize @message
  #   respond_to do |format|
  #     if @message.save
  #       format.html { redirect_to :back }
  #       format.json { render :show, status: :created, location: @message }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      respond_to do |f|
        f.html do
          redirect_to :back
        end
        f.json do
          render json: @message.to_json(:include => :user)
        end
      end
    else
      respond_to do |f|
        f.html do
          flash[:alert] = 'Errors'
      render :back
        end
        f.json do
          render json: @message
        end
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    authorize @message
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body, :friend_id, :conversation_id, :user_id)
    end
end
