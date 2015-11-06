class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def accept
    @requests = Request.find_by_user_id_and_requested_friend_id(params[:user_id], params[:requested_friend_id])
    @requests.are_friends = true
    @requests.did_confirm = true
    @requests.save
    @friend = Friend.new
    @friend.friend_requester_id = params[:user_id]
    @friend.friend_accepter_id = params[:requested_friend_id]
    @friend.save
    @conversation = Conversation.new
    @conversation.friend = @friend
    @conversation.save
    flash[:notice] = "You are now friends with #{@requests.user.full_name}"
    redirect_to home_path
  end

  def deny
    @requests = Request.find_by_user_id_and_requested_friend_id(params[:user_id], params[:requested_friend_id])
    @requests.destroy
    flash[:notice] = "You have denied the friend request sent by #{@requests.user.full_name}"
    redirect_to home_path
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = current_user.requests.build(:requested_friend_id => params[:requested_friend_id])
    if @request.save
      flash[:notice] = "Friend Request Sent."
      redirect_to :back
    else
      flash[:error] = "Unable to Send Request."
      redirect_to :back
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = current_user.requests.find(params[:id])
    @request.destroy
    flash[:notice] = "Friend Request Canceled."
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:user_id, :requested_friend_id, :are_friends, :did_confirm)
    end
end
