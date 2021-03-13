class Tracking < ApplicationRecord
  belongs_to :book
  validates :date, presence: true
end
