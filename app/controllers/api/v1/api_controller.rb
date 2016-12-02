module Api::V1
  class ApiController < ActionController::API
    include ActionController::Serialization

    before_action :find_model

    def default_serializer_options
      {
        root: false,
        include: '**'
      }
    end
  end
end
