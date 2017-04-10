ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('sinatra/activerecord')
require('./lib/team')
require('./lib/player')
require('./lib/game')

RSpec.configure do |config|
  config.after(:each) do
    Team.all.each() do |team|
      team.destroy()
    end
    Player.all.each() do |player|
      player.destroy()
    end
  end
end
