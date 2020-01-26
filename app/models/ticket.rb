class Ticket < ApplicationRecord
  STATUSES = ['Backlog', 'Todo', 'In progress', 'Quality Assurance', 'Done']
  PRIORITIES = ['Critical', 'Major', 'Normal', 'Low']

  validates :name, :description, presence: true
  validates :priority, inclusion: { in: PRIORITIES }
  validates :status, inclusion: { in: STATUSES }
  belongs_to :sprint
  belongs_to :user, optional: true
  has_one :review


  def next_status
    new_status = STATUSES[STATUSES.index(self.status) + 1]
    complete_ticket(self.priority) if new_status == 'Done'
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

  private

  def complete_ticket(priority)
    priority_faktor = {
      'Critical' => 3,
      'Major' => 2,
      'Normal' => 1,
      'Low' => 1
    }
    points = priority_faktor[priority] * 2
    self.user.gain_xp(points)
  end
end
