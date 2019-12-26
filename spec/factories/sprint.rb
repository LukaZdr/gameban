# frozen_string_literal: true

FactoryBot.define do
  factory :sprint do
    project_id { create(:project).id }
    start_time { Time.now }
    quality_1 { Faker::String.random }
    quality_2 { Faker::String.random }
    quality_3 { Faker::String.random }
    quality_4 { Faker::String.random }
    quality_5 { Faker::String.random }
    length { [1,2,3].sample }
  end
end
