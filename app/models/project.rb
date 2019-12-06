class Project < ApplicationRecord
  validate :name, presence: true, uniqueness: true
  has_many :tickets
  has_many :users
end