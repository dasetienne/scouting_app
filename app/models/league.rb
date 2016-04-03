class League < ActiveRecord::Base
    has_many :players
    has_many :teams
    validates :name, presence: true
end
