class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one :image_element, dependent: :destroy
  validates :mark, :model, :year, presence: true

  def create_image(image_params)
    self.image_element = ImageElement.create(image_params)
  end
end
