# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: 'New post was successfully created'
    else
      render(
        :new,
        status: :unprocessable_entity,
        notice: 'Post cannot be created'
      )
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update post_params
      redirect_to @post, notice: 'Post was successfully updated'
    else
      render(
        :edit,
        status: :unprocessable_entity,
        notice: 'Post cannot be updated'
      )
    end
  end

  def destroy
    @post = Post.find params[:id]

    if @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted'
    else
      render(
        :edit,
        status: :unprocessable_entity,
        notice: 'Post cannot be deleted'
      )
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :summary, :published)
  end
end
