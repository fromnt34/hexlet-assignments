# frozen_string_literal: true

module Attributes
  class Task
    def self.generate(i)
      {
        name: Faker::Lorem.sentence,
        description: Attributes.optional(Faker::Lorem.paragraph),
        user_id: i,
        status_id: rand(Status.count) + 1
      }
    end
  end
end
