module Api::V1
  class DashboardController < ApiController

    def index
      dashboard = Dashboard.new(params: params)
      render json: dashboard, serializer: DashboardSerializer
    end

    private
    def find_model
      nil
    end
  end
end
