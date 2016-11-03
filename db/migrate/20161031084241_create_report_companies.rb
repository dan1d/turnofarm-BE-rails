class CreateReportCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :report_companies do |t|
      t.integer :company_id
      t.integer :report_id
      t.integer :address_id

      t.timestamps
    end
  end
end
