class AddTeamToProject < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :team, null: false, foreign_key: true
    remove_column	:teams, :project_id
  end
end
