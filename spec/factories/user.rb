# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Color.color_name }
    last_name { Faker::Creature::Animal.name }
    email { Faker::Internet.email }
    password { 'changeme' }
  end
end
