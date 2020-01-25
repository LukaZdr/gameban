class Achievement < ApplicationRecord
  belongs_to :user
  validates :name, :description, :points, :goal, presence: true

  def completed?
    points == goal
  end
end