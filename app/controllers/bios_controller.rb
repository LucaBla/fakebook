class BiosController < ApplicationController
  def edit
    @bio = Bio.find(params[:id])
  end

  def update
    @bio = Bio.find(params[:id])
    disallow_illegal_move
    respond_to do |format|
      if @bio.update(bio_params)
        format.html { redirect_to user_url(@bio.user)}
        format.json { render :show, status: :ok, location: @bio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bio.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:content)
  end

  def disallow_illegal_move
    if current_user != @bio.user
      redirect_to(root_path, notice: "Not allowed")
      return 
    end
  end
end
