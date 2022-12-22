# frozen_string_literal: true

require_relative 'seeds_helper'

10.times do
  Task.new generate_attributes
end
