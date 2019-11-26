require 'faker'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :first_name, :last_name, :level, :xp, presence: true

  before_create :give_anonyme_name

  private

  def give_anonyme_name
    self.first_name = Faker::Color.color_name
    self.last_name = Faker::Creature::Animal.name
  end
end
