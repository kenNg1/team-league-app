require('spec_helper')
require('pry')

describe(Game) do
  describe("#all") do
    it("shows all") do
      team1 = Team.create({:name => 'Liverpool FC'})
      team2 = Team.create({:name => 'Chelsea FC'})
      game = Game.create({:team1_id => team1.id(), :team2_id => team2.id(), :team1_score => 10, :team2_score => 0})
      expect(Game.all()).to(eq([game]))
    end
  end

  describe("#add games with no scores") do
    it("shows all") do
      liverpool = Team.create({:name => 'Liverpool FC'})
      chelsea = Team.create({:name => 'Chelsea FC'})
      manutd = Team.create({:name => 'Man Utd'})
      game1 = Game.create({:team1_id => liverpool.id(), :team2_id => chelsea.id() })
      game2 = Game.create({:team1_id => liverpool.id(), :team2_id => manutd.id() })
      game3 = Game.create({:team1_id => chelsea.id(), :team2_id => liverpool.id()} )
      expect(liverpool.game_as_team1()).to(eq([game1, game2]))
    end
  end

  describe("#show a teams games") do
    it("shows all") do
      liverpool = Team.create({:name => 'Liverpool FC'})
      chelsea = Team.create({:name => 'Chelsea FC'})
      manutd = Team.create({:name => 'Man Utd'})
      game1 = Game.create({:team1_id => liverpool.id(), :team2_id => chelsea.id(), :team1_score => 10, :team2_score => 0})
      game2 = Game.create({:team1_id => liverpool.id(), :team2_id => manutd.id(), :team1_score => 20, :team2_score => 0})
      game3 = Game.create({:team1_id => chelsea.id(), :team2_id => liverpool.id(), :team1_score => 30, :team2_score => 40})
      expect(liverpool.game_as_team1()).to(eq([game1, game2]))
    end
  end
end
