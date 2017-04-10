ENV['RACK_ENV'] = 'test'

class Player < ActiveRecord::Base
  belongs_to(:team)
  #scope?
end
