# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.reply = true if params[:comment_id]
    @comment.save
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:post_id]
      @commentable = Post.friendly.find(params[:post_id])
    end
  end
end
