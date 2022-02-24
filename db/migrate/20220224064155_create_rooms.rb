class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :address
      t.integer :price
      
      t.timestamps
    end
  end
end
