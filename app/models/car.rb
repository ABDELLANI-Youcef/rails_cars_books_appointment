class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one :image_element, dependent: :destroy
  validates :mark, :model, :year, presence: true

  def as_json(options={})
    element = self.image_element
    image_path = nil
    unless element.nil?
      image_path = Rails.application.routes.url_helpers.rails_blob_path(element.image, only_path: true)
    end
    return {
      id: self.id,
      mark: self.mark,
      model: self.model,
      year: self.year,
      price: self.price,
      image: image_path,
    }
  end

end
