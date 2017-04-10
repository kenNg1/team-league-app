class CreateGames < ActiveRecord::Migration
  def change
    create_table(:games) do |t|
      t.column(:team1,:integer)
      t.column(:team2,:integer)
      t.column(:team1_score,:integer)
      t.column(:team2_score,:integer)
      t.timestamps()
    end
  end
end
