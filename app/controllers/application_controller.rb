# Base API controller
class ApplicationController < ActionController::API
  include ActionController::Serialization

  protected

  # def authenticate
  # end
  #
  # def render_unauthorized
  # end

  def render_errors(obj, status: :unprocessable_entity)
    render json: { errors: obj.errors }, status: status
  end
end
