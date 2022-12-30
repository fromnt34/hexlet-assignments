# frozen_string_literal: true

module Attributes
  autoload :User, './db/seeds_helper/attributes/user'
  autoload :Task, './db/seeds_helper/attributes/task'

  def self.optional(value)
    [value, nil].sample
  end
end
