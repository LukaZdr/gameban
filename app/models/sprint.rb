class Sprint < ApplicationRecord
  belongs_to :project
  has_many :tickets

  validate :different_qualities?
  validates :project_id, :start_time, :end_time, presence: true
  validates :quality_1, :quality_2, :quality_3, :quality_4, :quality_5, presence: true

  def code_qualeties
    [self.quality_1, self.quality_2, self.quality_3, self.quality_4, self.quality_5]
  end

  def different_qualities?
    unless code_qualeties.uniq.length == 5
      errors.add(:code_qualeties, "is not active")
    end
  end
end