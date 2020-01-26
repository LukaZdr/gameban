require 'faker'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :first_name, :last_name, :level, :xp, presence: true
  has_many :tickets
  has_many :projects
  has_many :achievements

  before_validation :give_anonyme_name
  after_create :create_achievements

  def gain_xp(gained_xp)
    prior_xp = xp
    self.xp += gained_xp * self.multiplier
    while self.xp >= next_lvl_xp_goal
      self.level += 1
    end
    save!
    update_user_tendencys(xp, prior_xp)
  end

  def company_rank
    User.order(xp: :desc).index(self) + 1
  end

  def next_lvl_xp_goal
    if self.level == 0
      10
    else
      self.level * 25
    end
  end

  def previous_lvl_xp_goal
    if self.level == 0
      0
    elsif self.level == 1
      10
    else
      (self.level-1) * 25
    end
  end

  def percent_of_current_level
    ((self.xp-previous_lvl_xp_goal).to_f/(next_lvl_xp_goal-previous_lvl_xp_goal)*100)
  end

  def create_achievements
    return if self.achievements.any?
    self.achievements.create(name:'Gotta go fast', description: '2x Points for 24h', points:0, goal:1)
    self.achievements.create(name:'Fast travel', description: 'Jump to the next level', points:0, goal:2)
    self.achievements.create(name:'Extra fuel', description: 'Recive 45xp', points:0, goal:2)
  end

  private

  def give_anonyme_name
    self.first_name ||= Faker::Color.color_name
    self.last_name ||= Faker::Creature::Animal.name
  end

  def update_user_tendencys(new_xp, prior_xp)
    lower_xp = new_xp - 1
    if User.where(xp: (prior_xp..lower_xp)).any?
      self.tendency = 0
    else
      User.where(xp: (prior_xp..lower_xp)).each do |user|
        user.tendency = -1
        user.save!
      end
      self.tendency = 1
    end
    save!
  end
end
