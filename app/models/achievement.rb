class Achievement < ApplicationRecord
  belongs_to :user
  validates :name, :description, :points, :goal, presence: true

  def current_percent
    ((self.points).to_f/(self.goal)*100)
  end

  def completed?
    self.points == goal
  end

  def redeemed?
    self.goal == -1
  end

  def add_point

  end

  def redeem
    self.goal = -1
    save
  end
end