class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      
      t.string		 :title
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
