# frozen_string_literal: true

10.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    summary: Faker::Lorem.sentence,
    published: [true, false].sample
  )
end
