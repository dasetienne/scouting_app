class PlayerSkill < ActiveRecord::Base
  belongs_to :player
  belongs_to :skill
end
