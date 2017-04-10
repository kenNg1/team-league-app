ENV['RACK_ENV'] = 'test'

class Team < ActiveRecord::Base
  has_many(:players)
end
