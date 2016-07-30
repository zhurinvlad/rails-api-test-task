module Api
  module V1
    # Basic controller for v1 API
    class ApiController < ApplicationController
      include ActionController::HttpAuthentication::Basic::ControllerMethods
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include Pundit

      rescue_from Pundit::NotAuthorizedError, with: :render_access_denied

      before_action :authenticate_from_token!,
                    except: [:index, :show, :auth_token]

      def auth_token
        authorized = authenticate_with_http_basic do |email, password|
          user = User.find_by(email: email).try(:authenticate, password)
          return render_unauthorized unless user
          user.update!(auth_token: SecureRandom.hex)
          render json: { auth_token: user.auth_token }
        end
        render_unauthorized unless authorized
      end

      def authorized_user
        render json: @current_user
      end

      protected

      def pundit_user
        @current_user
      end

      private

      def authenticate_from_token!
        authorized = authenticate_with_http_token do |token, _options|
          @current_user = User.find_by(auth_token: token)
        end

        render_unauthorized('invalid_token') unless authorized
      end

      def render_unauthorized(locale_key = 'bad_credentials')
        message = I18n.t("errors.auth.#{locale_key}")
        render json: { errors: { access: message } }, status: :unauthorized
      end

      def render_access_denied
        message = I18n.t('errors.auth.access_denied')
        render json: { errors: { access: message } }, status: :forbidden
      end

      def render_errors(obj, status: :unprocessable_entity)
        render json: { errors: obj.errors }, status: status
      end
    end
  end
end
