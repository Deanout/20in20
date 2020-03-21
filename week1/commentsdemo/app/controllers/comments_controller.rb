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
    if @comment.edit_history == ''
      @comment.edit_history = 'Original: ' + @comment.body.body.to_plain_text + "\n"
    else
      @comment.edit_history = @comment.edit_history + 'Edit: ' + params[:comment][:body] + "\n"
    end
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  def history
    @history = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:post_id]
      @commentable = Post.friendly.find(params[:post_id])
    end
  end
end
