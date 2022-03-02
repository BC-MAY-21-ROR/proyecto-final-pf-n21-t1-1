class CreateChambita < ActiveRecord::Migration[7.0]
  def change
    create_table :chambita do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :organizationo
      t.integer :salary
      t.string :puesto
      t.string :requerimientos
      t.string :etiquetas
      t.date :expiracion

      t.timestamps
    end
  end
end
