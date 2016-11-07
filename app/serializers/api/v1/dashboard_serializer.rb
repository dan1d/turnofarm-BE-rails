module Api::V1
  class DashboardSerializer < CoreSerializer

    attributes :selected, :addresses

    delegate :report, :addresses, to: :object

    def selected
      return unless object.selected
      @selected ||= AddressSerializer.new(object.selected, serializer_optnions)
    end

    def addresses
      @addresses ||= object.addresses.collect {|a| AddressSerializer.new(a, serializer_optnions)}
    end

    def serializer_optnions
      {include: "**", options: object.params}
    end
  end
end
