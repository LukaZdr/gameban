require 'faker'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :first_name, :last_name, :level, :xp, presence: true

  before_validation :give_anonyme_name

  def company_rank
    User.order(xp: :desc).index(self) + 1
  end


  private

  def give_anonyme_name
    self.first_name ||= Faker::Color.color_name
    self.last_name ||= Faker::Creature::Animal.name
  end
end
