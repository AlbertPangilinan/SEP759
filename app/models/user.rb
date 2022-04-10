class User < ApplicationRecord
  has_secure_password

  has_one :team_member
end
