class ApiController < ActionController::Base
  protect_from_forgery with: :null_session, prepend: true
end