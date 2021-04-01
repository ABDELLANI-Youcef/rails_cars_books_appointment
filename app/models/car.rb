class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one :image_element, dependent: :destroy
  validates :mark, :model, :year, presence: true

 
end
