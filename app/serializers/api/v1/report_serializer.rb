module Api::V1
  class ReportSerializer < CoreSerializer
    has_many :report_companies
    attributes :id, :results

    def results
      scp = object.report_companies.group_by {|q| q.address.try(:city) }
      arr = []
      scp.each do |k,v|
        city = Api::V1::CitySerializer.new(k)
        report_companies = v.collect {|q| Api::V1::ReportCompanySerializer.new(q) }
        arr << city
        arr << report_companies
      end
      arr.flatten
    end

  end
end
