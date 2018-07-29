class CreateMakes < ActiveRecord::Migration[5.1]
  def change
    create_table :makes do |t|
      t.string :name
      t.references :vehicle, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
