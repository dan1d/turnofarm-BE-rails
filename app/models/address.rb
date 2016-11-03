class Address < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :report_companies

  def print_values
    "> #{address}, company: #{company.name}, city: #{city.name}, province: #{city.province.name}, #{phone_number} "
  end
end
