require "nokogiri"
require "open-uri"
module Scrapper

  class DataPuller
    attr_accessor :date, :doc, :addresses, :report, :province
    BASE_URL = "http://cofatuc.org.ar"
    REPORT_URL = BASE_URL + "/farmacias-de-turno/?fecha="

    def initialize(date = Date.today)
      @date = date
      @doc = Nokogiri::HTML(open(REPORT_URL + date.to_s))
      @province = Province.where(name: "Tucuman").first_or_create
      @report = Report.where(date: date, province_id: province.id).first_or_create
      @addresses = []
    end


    def get_data
      entries = doc.css('#listado-farmacias p a')
      entries.each do |entry|
        company_source_id = entry["href"].split("=").last
        company_scrapper = Scrapper::CompanyBuilder.new(company_source_id, province)
        company_scrapper.run!
        if company_scrapper.company_created?
          addresses << company_scrapper.address
        end
      end
      build_report
    end

    def build_report
      addresses.each do |address|
        report.report_companies
        .where(address_id: address.id, company_id: address.company_id).first_or_create
      end
    end
  end
end
