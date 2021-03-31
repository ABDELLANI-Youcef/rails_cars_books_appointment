class Car < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one :image_element, dependent: :destroy
  validates :mark, :model, :year, presence: true

  def as_json(_options = {})
    element = image_element
    image_path = nil
    unless element.nil?
      image_path = Rails.application.routes.url_helpers.rails_blob_path(element.image, only_path: true)
    end
    {
      id: id,
      mark: mark,
      model: model,
      year: year,
      price: price,
      image: image_path
    }
  end
end
