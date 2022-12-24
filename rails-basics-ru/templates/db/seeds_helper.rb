# frozen_string_literal: true

def optional(value)
  [value, nil].sample
end

def generate_attributes
  status = ['new', 'in proccess', 'completed'].sample

  # rubocop:disable Lint/Syntax
  Hash[
    name: Faker::Lorem.sentence,
    description: optional(Faker::Lorem.paragraph),
    status:,
    creator: Faker::Name.name,
    performer: optional(Faker::Name.name),
    completed: status == 'completed'
  ]
  # rubocop:enable Lint/Syntax
end
