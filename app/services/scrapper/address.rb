require "nokogiri"
require "open-uri"

module Scrapper
  class Address
    attr_accessor :company, :hash, :province, :address, :city

    def initialize(company, province, hash)
      @province = province
      @company = company
      @hash = hash
      @city = City.where(province_id: province.id, name: hash[:city].try(:titleize)).first_or_create
    end

    def assign_address
      return @address if @address
      @address = company.addresses
      .where(hash.except(:city)).first_or_create
      @address
    end
  end
end
