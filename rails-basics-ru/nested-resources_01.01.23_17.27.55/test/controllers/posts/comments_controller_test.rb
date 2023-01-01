# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts :one
    @comment = post_comments :one
    @attrs = {
      post_id: posts(:one).id,
      body: Faker::Lorem.paragraph
    }
  end

  # test 'should create comment' do
  #   post post_comments_url(@post), params: { post_comment: @attrs }

  #   comment = PostComment.find_by @attrs

  #   assert { comment }
  #   assert_redirected_to posts_url(@post)
  # end

  test 'should get edit' do
    get edit_comment_url(@comment)
    assert_response :success
  end

  # test 'should update comment' do
  #   patch @comment, params: { comment: @attrs }

  #   @comment.reload

  #   assert { @comment.body == @attrs[:body] }
  #   assert_redirected_to posts_path
  # end

  # test 'should destroy comment' do
  #   delete @comment

  #   assert { !PostComment.exists? @comment.id }
  #   assert_redirected_to posts_path
  # end
end
