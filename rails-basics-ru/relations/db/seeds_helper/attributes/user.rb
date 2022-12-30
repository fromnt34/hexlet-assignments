# frozen_string_literal: true

module Attributes
  class User
    def self.generate
      {
        name: Faker::Name.name
      }
    end
  end
end
