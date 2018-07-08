class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :name
      t.string :url
      t.string :avatar_url

      t.timestamps
    end
  end
end
