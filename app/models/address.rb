class Address < ApplicationRecord
  attr_accessor :selected
  belongs_to :company
  belongs_to :city
  has_many :report_companies

  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  def print_values
    "> #{address}, company: #{company.name}, city: #{city.name}, province: #{city.province.name}, #{phone_number} "
  end

  def self.find_addresses(params, report_id, without_id: nil)
    scp = report_scope(report_id)
    scp = without_id ? scp.without_address(without_id) : scp
    scp.location_scope(params)
  end

  def self.location_scope(params)
    latitude = Float(params[:latitude])
    longitude = Float(params[:longitude])
    within(20, origin: [latitude, longitude])
  end

  def self.report_scope(report_id)
    joins(:report_companies).where(report_companies: {report_id: report_id})
  end

  def self.without_address(id)
    where.not(id: id)
  end
end
