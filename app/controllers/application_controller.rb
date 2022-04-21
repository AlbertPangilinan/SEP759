class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!
  helper_method :logged_in?, :current_user
end
