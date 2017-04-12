ENV['RACK_ENV'] = 'test'
require('pg')
DB = PG.connect({:dbname => "team_league_development"})

class Team < ActiveRecord::Base
  has_many(:players)
  has_many(:game_as_team1, :class_name => 'Game', :foreign_key => 'team1_id')
  has_many(:game_as_team2, :class_name => 'Game', :foreign_key => 'team2_id')

  def goaldiff()
    gd = 0
    results = DB.exec("SELECT * FROM games WHERE team1_id=#{self.id()} OR team2_id=#{self.id()};")
    results.each() do |result|
      if result['team1_id'].to_i == self.id()
        gd += result.fetch('team1_score').to_i
        gd -= result.fetch('team2_score').to_i
      else
        gd += result.fetch('team2_score').to_i
        gd -= result.fetch('team1_score').to_i
      end
    end
    return gd
  end

  def winrate()
    wld = {:win=> 0, :loss=> 0, :draw=>0}
    results = DB.exec("SELECT * FROM games WHERE team1_id=#{self.id()} OR team2_id=#{self.id()} team2_score!=nil;")
    results.each() do |result|
      if result['team1_id'].to_i == self.id()
        if(result.fetch('team1_score')).>(result.fetch('team2_score'))
          wld[:win] += 1
        elsif result.fetch('team1_score') < result.fetch('team2_score')
          wld[:loss] += 1
        else
          wld[:draw] += 1
        end
      else
      if result.fetch('team2_score') > result.fetch('team1_score')
        wld[:win] += 1
      elsif result.fetch('team2_score') < result.fetch('team1_score')
        wld[:loss] += 1
      else
        wld[:draw] += 1
      end
      end
    end
    return wld
  end
end
