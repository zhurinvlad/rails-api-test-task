# Controllers specs helpers
module ControllersHelpers
  def authenticate_from_token!
    auth_token = SecureRandom.hex
    create(:user, auth_token: auth_token)
    token_auth(auth_token)
  end
end
