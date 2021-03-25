class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  has_many :cars, through: :appointment
  validates_presence_of :name, :email, :password_digest
  validates :name, :email, uniqueness: true
end
