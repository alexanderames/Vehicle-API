class AddUserToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_reference :vehicles, :user, foreign_key: true
  end
end
