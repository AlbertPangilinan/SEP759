class SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, prepend: true

  respond_to :json

  before_action :revoke_keys, only: :destroy

  def create 
    super do |user|
      user.api_keys.create!(token: SecureRandom.hex)
    end
  end

  private

  def revoke_keys
    puts("current key:")
    # puts(current_api_key)
    # current_api_key&.destroy
    current_user.api_keys.each do |key|
      key.destroy
    end
  end
end