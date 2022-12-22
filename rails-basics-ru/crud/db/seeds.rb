# frozen_string_literal: true

require_relative 'seeds_helper.rb'

10.times do
  status = ['new', 'in proccess', 'completed'].sample

  Task.create(
    name: Faker::Lorem.sentence,
    description: optional(Faker::Lorem.paragraph),
    status:,
    creator: Faker::Name.name,
    performer: optional(Faker::Name.name),
    completed: status == 'completed'
  )
end