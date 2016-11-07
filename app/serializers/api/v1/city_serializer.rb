module Api::V1
  class CitySerializer < CoreSerializer
    attributes :id, :name, :is_city
    belongs_to :province

    def is_city
      true
    end
  end
end
