class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :sprints
  has_many :users
end