class Book < ApplicationRecord
    has_many :trackings, dependent: :destroy
    belongs_to :user
    validates :name, presence: true
end
