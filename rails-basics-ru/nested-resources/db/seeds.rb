# frozen_string_literal: true

require_relative 'seeds_helper'

10.times do |i|
  Post.create Attributes::Post.generate
  PostComment.create Attributes::Post::Comment.generate(i)
end
