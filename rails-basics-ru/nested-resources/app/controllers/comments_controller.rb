# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]
  before_action :set_comment, only: %i[edit update destroy]

  def create
    comment = @post.post_comments.build comment_params

    if comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    # rubocop:disable Style/EmptyElse
    else
      # redirenct_to <_>, status: :unprocessable_entity
    end
    # rubocop:enable Style/EmptyElse
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      # TODO: make redirect to post page
      redirect_to posts_path, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    # TODO: make redirect to post page
    redirect_to posts_path, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def set_comment
    @comment = PostComment.find params[:id]
  end

  def comment_params
    params.require(:post_comment).permit(:post_id, :body)
  end
end
