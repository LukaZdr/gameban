class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :give_anonyme_name

  private
  def give_anonyme_name
    self.first_name = 'Gustav'
    self.last_name = 'Horst'
  end
end
