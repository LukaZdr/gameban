# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
  end
end
