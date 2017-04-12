ENV['RACK_ENV'] = 'test'

class Game < ActiveRecord::Base
  belongs_to(:team1, :class_name => 'Team')
  belongs_to(:team2, :class_name => 'Team')

end

# attr_accessible :player, :played, :score, :details, :viewed, :read
