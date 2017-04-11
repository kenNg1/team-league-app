require("bundler/setup")
    Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @teams = Team.all()
  @players = Player.all()
  erb(:index)
end

  delete('/teams') do
    team = Team.find(params.fetch('id').to_i)
    team.delete
    redirect("/")
  end

  patch('/teams') do
    team = Team.find(params.fetch('id').to_i)
    name = params.fetch('name')
    team.update({:name => name})
    redirect('/')
  end

post('/teams') do
  name = params.fetch('name')
  new_team = Team.create(:name => name)
  redirect('/')
end

post('/players') do
  team_id = params.fetch('team_id')
  name = params.fetch('name')
  new_player = Player.create(:name => name, :team_id => team_id)
  # new_url = '/teams/' + team_id --> Alternative method
  # redirect new_url --> alternative method
  redirect ("/teams/#{team_id}")
end

get("/teams/:id") do
  @team = Team.find(params.fetch('id').to_i)
  @teams= Team.all()
  @games = @team.game_as_team1 + @team.game_as_team2
  erb(:team)
end

# a href (/teams/17/home)
# params.fetch(home_or_away) --> home
# a href (/teams/17/away)
# params.fetch(home_or_away) --> away
# http query parameters
#
# http://localhost:4567/teams/17
# a href (/teams/17/?add_home=true)
# params.fetch(add_home, false)
# a href (/teams/17/?add_away=true)
# params.fetch(add_away, false)

  get("/teams/:id/add_home") do
    @team = Team.find(params.fetch('id').to_i)
    @teams= Team.all()
    @games = @team.game_as_team1 + @team.game_as_team2
    @add_home = true
    erb(:team)
  end
  get("/teams/:id/add_away") do
    @team = Team.find(params.fetch('id').to_i)
    @teams= Team.all()
    @games = @team.game_as_team1 + @team.game_as_team2
    @add_home = false
    erb(:team)
  end
  post("/games") do
    team1_id = params.fetch('team1_id')
    team2_id = params.fetch('team2_id')
    game = Game.create({:team1_id => team1_id, :team2_id => team2_id })
    self_id = params.fetch('self_id')
    redirect ("/teams/#{self_id}")
    end
  patch("/games") do
    game = Game.find(params.fetch('game_id').to_i())
    team1_score = params.fetch('team1_score')
    team2_score = params.fetch('team2_score')
    game.update({:team1_score => team1_score, :team2_score => team2_score })
    redirect ("/")
  end
  get("/teams/:id/add_result") do
    @team = Team.find(params.fetch('id').to_i)
    @teams= Team.all()
    @games = @team.game_as_team1 + @team.game_as_team2
    @add_result = true
    erb(:team)
  end
