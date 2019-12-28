class Ticket < ApplicationRecord
  STATUSES = ['Backlog', 'Todo', 'In progress', 'Quality Assurance', 'Done']
  PRIORITIES = ['Critical', 'Major', 'Moderate', 'Low']

  validates :name, :description, presence: true
  validates :priority, inclusion: { in: PRIORITIES }
  validates :status, inclusion: { in: STATUSES }
  belongs_to :sprint
  belongs_to :user, optional: true
end