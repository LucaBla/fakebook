class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user))
                 .order(created_at: :desc)
    #@posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @new_comment = current_user.comments.build
  end

  # GET /posts/new
  def new
    if params[:type] == 'img'
      @postable = PostImage.new
    else
      @postable = PostText.new
    end
    @post = current_user.posts.build(postable: @postable)
  end

  # GET /posts/1/edit
  def edit
    disallow_illegal_move
  end

  # POST /posts or /posts.json
  def create
    if type_param[:type] == 'img'
      @postable = PostImage.new(postable_params[:postable_attributes])
    else
      @postable = PostText.new(postable_params[:postable_attributes])
    end
    @post = current_user.posts.build(post_params)
    @post.postable = @postable
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity, notice: "Something went wrong." }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    disallow_illegal_move
    @postable = @post.postable
    @postable.update(postable_params[:postable_attributes])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def disallow_illegal_move
    if current_user != @post.user
      redirect_to(root_path, notice: "Not allowed")
      return 
    end
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :postable_attributes)
  end

  def postable_params
    params.require(:post).permit(postable_attributes: [:content])
  end

  def type_param
    params.require(:post).permit(:type)
  end
end
