class CreateCargos < ActiveRecord::Migration[8.1]
  def change
    create_table :cargos do |t|
      t.string :description
      t.integer :weight
      t.string :category
      t.string :status
      t.references :spaceship, null: false, foreign_key: true
      t.timestamps
    end
  end
end
