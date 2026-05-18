class CreateSpaceships < ActiveRecord::Migration[8.1]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :model
      t.integer :max_capacity
      t.string :status

      t.timestamps
    end
  end
end
