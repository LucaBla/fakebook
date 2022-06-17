class FriendRequestsController < ApplicationController
  def index
    @friend_requests = current_user.received_requests
  end
end
