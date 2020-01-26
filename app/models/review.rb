class Review < ApplicationRecord
  validates :text, :quality_1, :quality_2, :quality_3, :quality_4, :quality_5, presence: true
  belongs_to :ticket
end