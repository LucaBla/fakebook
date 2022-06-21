class LikesController < ApplicationController
  before_action :set_like, only: %i[ destroy ]

  def create
    @like = current_user.likes.build(like_params)
    respond_to do |format|
      if @like.save
        format.html { render @like.post, notice: "Post was successfully liked." }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_to posts_url, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like.destroy

    respond_to do |format|
      format.html { render @like.post, notice: "like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_like
    @like = Like.find( params[:id])
  end

  def like_params
    params.permit(:post_id, :user_id)
  end
end
