class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :company_id
      t.string :address
      t.string :number
      t.integer :city_id

      t.timestamps
    end
  end
end
