class Cargo < ApplicationRecord
  belongs_to :spaceship, optional: true
  validates :description, :weight, :category, :status, presence: true
  validates :weight, numericality: { only_integer: true, greater_than: 0 }
  enum status: { preparado: "preparado", cargado: "cargado", en_transito: "en_transito", entregado: "entregado" }
  enum category: { minerales: "minerales", provisiones: "provisiones", tecnologia: "tecnologia", armamento: "armamento" }
end
