# frozen_string_literal: true

module Attributes
  module Post
    autoload :Comment, './db/seeds_helper/attributes/post/comment'

    def self.generate
      {
        title: Faker::Lorem.sentence,
        body: Attributes.optional(Faker::Lorem.paragraph)
      }
    end
  end
end
