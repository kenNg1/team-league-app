require('spec_helper')
require('pry')

describe(Game) do
  describe("#all") do
    it("shows all") do
      team1 = Team.create({:name => 'Liverpool FC'})
      team2 = Team.create({:name => 'Chelsea FC'})
      game = Game.create({:team1 => team1, :team2 => team2, :team1_score => 10, :team2_score => 0})
      expect(Game.all()).to(eq([game]))
    end
  end
end
