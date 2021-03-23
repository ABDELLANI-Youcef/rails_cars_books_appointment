class Car < ApplicationRecord
  validates :mark, :model, :year, presence: true
end
