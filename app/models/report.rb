class Report < ApplicationRecord
  belongs_to :province
  has_many :report_companies

  def print_report
    puts "> Farmacias de turno para el dia: #{date}"
     report_companies.collect do |rc|
      puts rc.address.print_values
    end
  end
end