class Report < ApplicationRecord
  belongs_to :province
  has_many :report_companies

  def print_report
    puts "> Farmacias de turno para el dia: #{date}"
     report_companies.collect do |rc|
      puts rc.address.print_values
    end
  end

  def self.get_report(params)
    puts params.inspect
    if params[:id]
      find(params[:id])
    elsif date = params[:date].try(:to_date)
      where(date: date).first # todo scope by prov.
    end
  end
end
