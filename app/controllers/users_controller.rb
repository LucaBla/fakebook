class UsersController < ApplicationController

  def index
    @users = User.all

    if params[:search_by_name] != '' && params.has_key?(:search_by_name)
      @users = @users.where("lower(username) LIKE ?", "%#{params[:search_by_name].downcase}%")
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(post_params)
        format.html { redirect_to root_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :username, :search_by_name)
  end
end
