module Api::V1
  class ReportCompanySerializer < CoreSerializer
    attributes :id, :updated_at, :created_at

    belongs_to :company
    belongs_to :address
  end
end
