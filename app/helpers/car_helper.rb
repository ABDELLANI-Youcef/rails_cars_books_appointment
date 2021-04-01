module CarHelper
  
  def cars_json(cars)
    cars.map{|e| as_json(e)}
  end
  private

  def as_json(car, _options = {})
    element = car.image_element
    image_path = nil
    unless element.nil?
      image_path = Rails.application.routes.url_helpers.rails_blob_path(element.image, only_path: true)
    end
    {
      id: car.id,
      mark: car.mark,
      model: car.model,
      year: car.year,
      price: car.price,
      image: image_path
    }
  end
end
