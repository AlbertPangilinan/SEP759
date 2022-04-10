class Team < ApplicationRecord
  validates :name, presence: true, allow_nil: true
  validates :abbrev, presence: true, allow_nil: true, length: { maximum: 4 }
  
  belongs_to :region
  has_many :team_members
  has_and_belongs_to_many :events

  before_save :capitalize_abbrev

  def capitalize_abbrev
    self.abbrev.upcase!
  end
end
