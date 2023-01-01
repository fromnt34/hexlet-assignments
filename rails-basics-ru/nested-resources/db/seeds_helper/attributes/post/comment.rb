# frozen_string_literal: true

module Attributes
  module Post
    class Comment
      def self.generate(i)
        {
          post_id: i,
          body: Faker::Lorem.paragraph
        }
      end
    end
  end
end
