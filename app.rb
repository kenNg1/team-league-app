require("bundler/setup")
    Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @teams = Team.all()
  @players = Player.all()
  binding.pry
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
  erb(:team)
end
