ENV['RACK_ENV'] = 'test'

class Team < ActiveRecord::Base
  has_many(:players)
  has_many(:game_as_team1, :class_name => 'Game', :foreign_key => 'team1_id')
  has_many(:game_as_team2, :class_name => 'Game', :foreign_key => 'team2_id')
end
