class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :sprints
  has_many :users


  def tickets
    self.sprints.map(&:tickets).flatten
  end

  def get_column_tickets(status)
    self.tickets.select { |ticket| ticket.status == status }
  end

  def current_sprint
    self.sprints.last
  end
end