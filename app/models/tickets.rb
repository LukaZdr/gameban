class Ticket < ApplicationRecord
  validate :name, :description, presence: true
  belongs_to :sprints
  belongs_to :user
end