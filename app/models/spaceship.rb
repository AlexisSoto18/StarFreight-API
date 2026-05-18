class Spaceship < ApplicationRecord
  validates :name, :model, :max_capacity, :status, presence: true
  validates :max_capacity, numericality: { only_integer: true, greater_than: 0 }
  enum :status, { en_puerto: "en_puerto", en_mantenimiento: "en_mantenimiento", en_viaje: "en_viaje" }
  has_many :cargos, dependent: :destroy
  has_many :spaceship_routes, dependent: :destroy
  has_many :routes, through: :spaceship_routes
end
