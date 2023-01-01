# frozen_string_literal: true

module Attributes
  autoload :Post, './db/seeds_helper/attributes/post'

  def self.optional(value)
    [value, nil].sample
  end
end
