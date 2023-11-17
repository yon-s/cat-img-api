class ApisController < ApplicationController
  def upload_image
    image = params[:image]
    begin
      if image.present?
        tags = Vision.get_image_data(image)
    
        render json: { tags: tags }
        
      else
        render json: { error: 'Image not found in params' }, status: :unprocessable_entity
      end
    rescue StandardError => e
      Rails.logger.error("Error in Vision.get_image_data: #{e.message}")
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
