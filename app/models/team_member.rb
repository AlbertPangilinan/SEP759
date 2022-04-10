class TeamMember < ApplicationRecord
  validates :ign, presence: true, allow_nil: true
  validates :country, presence: true, allow_nil: true

  belongs_to :user
  belongs_to :team

  enum role: [:player, :sub, :coach]
  enum control_scheme: [:not_applicable, :controller, :keyboard_and_mouse]

end
