module Requests
  # DRY basic auth
  module AuthHelpers
    def basic_auth(login, password)
      credentials = ActionController::HttpAuthentication::Basic
                    .encode_credentials(login, password)
      request.env['HTTP_AUTHORIZATION'] = credentials
    end
  end

  # DRY json parsing
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end
end
