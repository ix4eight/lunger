class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'コメントを投稿しました'
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
