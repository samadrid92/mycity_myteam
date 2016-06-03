class Team < ActiveRecord::Base
  belongs_to :city
  has_many :memories
end
