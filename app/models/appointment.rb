class Appointment < ApplicationRecord
  validates :city, :date, :car, presence: true
  belongs_to :car
  belongs_to :user
end
