class AddCoordinatorToTeams < ActiveRecord::Migration
  def change
    add_column(:teams, :coordinator, :string)
  end
end
