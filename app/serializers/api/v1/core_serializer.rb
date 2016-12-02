module Api::V1
  class CoreSerializer < ActiveModel::Serializer
    attributes :id

    def options
      @options = instance_options[:options]
    end
  end
end
