class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.integer :mileage
      t.string :plate_state

      t.timestamps
    end
  end
end
