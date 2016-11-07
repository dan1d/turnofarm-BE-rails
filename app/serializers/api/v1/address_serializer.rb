module Api::V1
  class AddressSerializer < CoreSerializer
    attributes :id, :address, :company_id, :phone_number,
               :latitude, :longitude

    attributes :distance

    belongs_to :city
    belongs_to :company

    def distance
      return unless options
      lat = options["latitude"]
      lng = options["longitude"]
      return unless lat && lng
      unit = options["unit"] || :kms
      object.distance_to([lat, lng], units: unit)
    end

  end
end
