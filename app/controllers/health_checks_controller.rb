class HealthChecksController < ApplicationController
  def index
    render json: { message: '成功' }, status: :ok
  end
end
