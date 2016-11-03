class AddLocaltyIdToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :localty_id, :integer
  end
end
