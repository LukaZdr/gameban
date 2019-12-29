# frozen_string_literal: true

FactoryBot.define do
  factory :sprint do
    project_id { create(:project).id }
    start_time { Time.now }
    quality_1 { Faker::Food.dish }
    quality_2 { Faker::Food.fruits }
    quality_3 { Faker::Food.ingredient }
    quality_4 { Faker::Food.measurement }
    quality_5 { Faker::Food.spice }
    length { [1,2,3].sample }
  end
end
