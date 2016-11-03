class AddProvinceIdToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :province_id, :integer
  end
end
