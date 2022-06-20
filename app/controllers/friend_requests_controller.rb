class FriendRequestsController < ApplicationController
  def index
    @friend_requests = current_user.received_requests
  end

  def create
    @friend_request = current_user.sended_requests.build(fr_params)
    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to users_path, notice: "FriendRequest was successfully send." }
        format.json { render :show, status: :created, location: @friend_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    @friend_request = FriendRequest.find(fr_params[:id])
    @friendship = Friendship.new
    @friendship.user_id = current_user.id
    @friendship.friend_id = @friend_request.sender_id

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to friend_requests_path, notice: "FriendRequest was successfully accepted." }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy

    respond_to do |format|
      format.html { redirect_to friend_requests_url, notice: "friendrequest was successfully declined." }
      format.json { head :no_content }
    end
  end

  private
  def fr_params
    params.permit(:receiver_id, :id)
  end
end
