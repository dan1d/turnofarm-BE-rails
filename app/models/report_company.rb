class ReportCompany < ApplicationRecord
  belongs_to :report
  belongs_to :company
  belongs_to :address
end
