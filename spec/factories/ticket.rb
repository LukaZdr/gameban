# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    sprint_id { create(:sprint).id }
    name { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    hours_of_work { rand(1..30) }
    priority { Ticket::PRIORITIES.sample }
    status { Ticket::STATUSES.sample }
  end
end