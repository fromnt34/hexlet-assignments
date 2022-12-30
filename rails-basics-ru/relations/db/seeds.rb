# frozen_string_literal: true

require_relative 'seeds_helper'

10.times do |i|
  User.create Attributes::User.generate
  Task.create Attributes::Task.generate(i)
end
