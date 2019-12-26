class Sprint < ApplicationRecord
  belongs_to :project
  has_many :tickets

  validates :project_id, :start_time, :end_time, presence: true
end