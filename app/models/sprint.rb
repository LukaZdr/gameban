class Sprint < ApplicationRecord
  belongs_to :project
  has_many :tickets
end