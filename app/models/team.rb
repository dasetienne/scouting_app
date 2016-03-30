class Team < ActiveRecord::Base
  has_many :players
  belongs_to :leagues
  validates :name, presence: true
end
