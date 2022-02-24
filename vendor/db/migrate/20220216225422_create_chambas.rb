class CreateChambas < ActiveRecord::Migration[7.0]
  def change
    create_table :chambas do |t|
      t.string :name
      t.string :skill
      t.integer :salary

      t.timestamps
    end
  end
end
