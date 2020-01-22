class Ticket < ApplicationRecord
  STATUSES = ['Backlog', 'Todo', 'In progress', 'Quality Assurance', 'Done']
  PRIORITIES = ['Critical', 'Major', 'Normal', 'Low']

  validates :name, :description, presence: true
  validates :priority, inclusion: { in: PRIORITIES }
  validates :status, inclusion: { in: STATUSES }
  belongs_to :sprint
  belongs_to :user, optional: true


  def next_status
    new_status = STATUSES[STATUSES.index(self.status) + 1]
    return if new_status == nil

    self.status = new_status
    save!
  end

  def previous_status
    new_status = STATUSES[STATUSES.index(self.status) - 1]
    return if new_status == nil

    self.status = new_status
    save!
  end
end