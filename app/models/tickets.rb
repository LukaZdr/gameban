class Ticket < ApplicationRecord
  validate :name, :description, presence: true
  belongs_to :project
  belongs_to :user
end