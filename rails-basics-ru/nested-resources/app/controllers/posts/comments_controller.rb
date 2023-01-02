# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def edit
      @comment = resource_post.comments.find params[:id]
    end

    def create
      @comment = resource_post.comments.build comment_params

      if @comment.save
        redirect_to resource_post, notice: 'Comment was successfully created.'
      else
        render 'posts/show', status: :unprocessable_entity
      end
    end

    def update
      comment = resource_post.comments.find params[:id]

      if comment.update(comment_params)
        redirect_to resource_post, notice: 'Comment was successfully updated.'
      else
        @comment = comment

        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      comment = PostComment.find params[:id]

      comment.destroy

      redirect_to resource_post, notice: 'Comment was successfully destroyed.'
    end

    private

    def comment_params
      params.require(:post_comment).permit(:body)
    end
  end
end
