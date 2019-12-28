class Ticket < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :sprints
  belongs_to :user

  COLUMNS = ['Backlog', 'Todo', 'In progress', 'Quality Assurance', 'Done']
end