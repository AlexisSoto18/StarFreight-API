class Route < ApplicationRecord
  has_many :spaceship_routes, dependent: :destroy
  has_many :spaceships, through: :spaceship_routes
  validates :origin, :destination, :distance, presence: true
  validates :distance, numericality: { only_integer: true, greater_than: 0 }
end
