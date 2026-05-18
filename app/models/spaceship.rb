class Spaceship < ApplicationRecord
  validates :name, :model, presence: true
  validates :max_capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[in_port traveling maintenance] }
  # Associations
  # A spaceship can have many cargos and routes through spaceship_routes
  has_many :cargos, dependent: :destroy
  has_many :spaceship_routes, dependent: :destroy
  has_many :routes, through: :spaceship_routes
end
