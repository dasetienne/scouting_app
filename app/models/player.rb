class Player < ActiveRecord::Base

  has_attached_file :photo, :styles =>
  { :medium => "300x300>", :thumb => "100x100>", :small =>"100x100>" },
  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo,
  :content_type => /\Aimage\/.*\Z/

  belongs_to :author
  belongs_to :league
  belongs_to :team
  belongs_to :position
  has_many :player_skills
  has_many :skills, through: :player_skills
  has_many :comments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team, presence: true
  validates :position, presence: true

end
