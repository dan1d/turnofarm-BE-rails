class AddSourceIdToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :source_id, :integer
  end
end
