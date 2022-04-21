class ApiController < ActionController::Base
  protect_from_forgery with: :null_session, prepend: true

  before_action :restrict_access

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(token: token)
    end
  end
end