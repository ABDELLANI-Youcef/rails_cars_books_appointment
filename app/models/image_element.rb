class ImageElement < ApplicationRecord
  belongs_to :car
  has_one_attached :image
end
