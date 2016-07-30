module Api
  module V1
    # Basic controller for v1 API
    class ApiController < ApplicationController
      include ActionController::HttpAuthentication::Basic::ControllerMethods
      include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate_from_token,
                    except: [:index, :show, :auth_token]

      def auth_token
        authenticate_with_http_basic do |email, password|
          user = User.find_by(email: email).try(:authenticate, password)
          return render_unauthorized unless user
          user.update!(auth_token: SecureRandom.hex)
          return render json: { auth_token: user.auth_token }
        end
        render_unauthorized
      end

      private

      def authenticate_from_token
        authorized = authenticate_with_http_token do |token, _options|
          @current_user = User.find_by(auth_token: token)
        end

        render_unauthorized('invalid_token') unless authorized
      end

      def render_unauthorized(locale_key = 'bad_credentials')
        message = I18n.t("errors.auth.#{locale_key}")
        render json: { errors: { access: message } }, status: :unauthorized
      end

      def render_errors(obj, status: :unprocessable_entity)
        render json: { errors: obj.errors }, status: status
      end
    end
  end
end