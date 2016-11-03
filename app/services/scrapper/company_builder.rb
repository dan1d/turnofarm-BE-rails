require "nokogiri"
require "open-uri"

module Scrapper
  class CompanyBuilder
    attr_accessor :doc, :company, :entries, :province, :address, :hash
    COMPANY_URL = Scrapper::DataPuller::BASE_URL + "/farmacias-de-turno/?farmaciaID="

    def initialize(company_id, province)
      @doc = Nokogiri::HTML(open(COMPANY_URL + company_id))
      @province = province
      @company = Company.where(source_id: company_id).first_or_create
      @entries = doc.css(".entry-content h3")
      @hash = {}
    end

    def run!
      entries.each_with_index do |entry, index|
        paragraph_text = doc.css(".entry-content p")[index].text
        hash[entry.text] = paragraph_text.strip
      end
      fill_company
      assign_address
    end

    def company_created?
      company.persisted?
    end

    def fill_company
      company_name = doc.css(".entry-content h1").text
      company.update_attributes(name: company_name)
    end

    def assign_address
      text = doc.css(".entry-content script").text
      geolocation = {lat: "", long: ""}
      if text.present?
        geolocation[:lat] = text.split("lat = \"").last.split("\"").first
        geolocation[:long] = text.split("long = \"").last.split("\"").first
      end
      phone_number =
      address_hash = {
        phone_number: hash["Teléfono"],
        address: hash["Domicilio"],
        city: hash["Localidad"],
        latitude: geolocation[:lat],
        longitude: geolocation[:long]
      }
      @address = Scrapper::Address.new(company, province, address_hash).assign_address
    end

    def string_between_markers(marker1, marker2)
      text[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
    end
  end
end
