class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  def set_post
    @post = Post.find(params[:post_id])
  end
end
