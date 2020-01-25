class Achievement < ApplicationRecord
  belongs_to :user
  validates :name, :description, :points, :goal, presence: true

  def current_percent
    ((self.points).to_f/(self.goal)*100)
  end

  def completed?
    points == goal
  end
end