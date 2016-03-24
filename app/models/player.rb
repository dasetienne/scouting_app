class Player < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team, presence: true
  validates :position, presence: true
end
