class League < ActiveRecord::Base
    has_many :players
    validates :name, presence: true
end
