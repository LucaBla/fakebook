class FriendshipsController < ApplicationController
  def destroy
    @friendship = Friendship.find(params[:id])
    @inverse_friendship = Friendship.where(user_id: @friendship.friend_id,
                                           friend_id: @friendship.user_id).first
    @friendship.destroy
    @inverse_friendship.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path}
      format.json { head :no_content }
    end
  end
end
