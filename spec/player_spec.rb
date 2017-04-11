require('spec_helper')

describe(Player) do
  describe("#team") do
    it("tells which team it belongs to") do
      test_team = Team.create({:name => 'engineering'})
      test_player = Player.create({:name => 'bob', :team_id => test_team.id()})
      expect(test_player.team_id()).to(eq(test_team.id()))
    end
  end
end
