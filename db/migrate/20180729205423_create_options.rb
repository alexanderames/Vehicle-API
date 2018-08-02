class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.integer :seats
      t.string :transmission
      t.string :drivetrain
      t.string :fuel_type
      t.string :style
      t.string :color
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
