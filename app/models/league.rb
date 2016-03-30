class League < ActiveRecord::Base
    has_many :players
    has_many :leagues
    validates :name, presence: true
end
