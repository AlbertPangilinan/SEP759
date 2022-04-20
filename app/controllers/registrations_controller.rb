class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session, prepend: true

  respond_to :json
end