class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_res
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_res

  private

  def not_found_res invalid
    render json: { errors: invalid.message }, status: :not_found
  end

  def unprocessable_entity_res invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

end
