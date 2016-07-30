module Requests
  # DRY auth
  module AuthHelpers
    def basic_auth(login, password)
      credentials = ActionController::HttpAuthentication::Basic
                    .encode_credentials(login, password)
      request.env['HTTP_AUTHORIZATION'] = credentials
    end

    def token_auth(token)
      request.env['HTTP_AUTHORIZATION'] = "Token token=#{token}"
    end
  end

  # DRY json parsing
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end
end
