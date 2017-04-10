require('spec_helper')

describe(Team) do
  describe("#players") do
    it("tells which players are in it") do
      test_team = Team.create({:name => "Spaghetti Monsters"})
      test_player1 = Player.create({:name => "Little Fresh Meat", :team_id => test_team.id})
      test_player2 = Player.create({:name => "Big Fresh Meat", :team_id => test_team.id})
      expect(test_team.players()).to(eq([test_player1, test_player2]))
    end
  end
end
