class Player < ActiveRecord::Base
  belongs_to :author
  has_many :player_skills
  has_many :skills, through: :player_skills
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team, presence: true
  validates :position, presence: true
end
