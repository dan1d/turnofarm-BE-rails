require "nokogiri"
require "open-uri"

class DataPuller
  attr_accessor :date, :doc
  URL = "http://cofatuc.org.ar/farmacias-de-turno/?fecha="

  def initialize(date = Date.today)
    @date = date
    @doc = Nokogiri::HTML(open(URL + date))

  end


  def get_data
    entries = doc.css('#listado-farmacias')
    entries.each do |entry|
      byebug
    end
  end

end
