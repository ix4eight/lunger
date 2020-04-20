class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order("created_at DESC").limit(10)
  end

  def new
    @post = Post.new
    @post.images.new
    @posts = Post.includes(:images).order('created_at DESC')
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    else
      @post.images.new
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(params[:id]), notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :language_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
end
