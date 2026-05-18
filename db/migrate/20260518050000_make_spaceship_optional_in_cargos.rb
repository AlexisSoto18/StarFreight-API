class MakeSpaceshipOptionalInCargos < ActiveRecord::Migration[8.1]
  def change
    change_column_null :cargos, :spaceship_id, true
  end
end
