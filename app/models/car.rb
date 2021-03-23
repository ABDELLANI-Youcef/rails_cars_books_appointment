class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :mark, :model, :year, presence: true
end
