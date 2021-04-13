class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one :image_element, dependent: :destroy
  validates :mark, :model, :year, presence: true

  def self.create_car_with_image(car, car_params)
    car.image_element = ImageElement.create(image: car_params[:image]) # you see you don't need a separate image_params
    car.save
  end
end
