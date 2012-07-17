class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :building_name
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
