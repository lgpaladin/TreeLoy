class AddHbtmWithTeamForUsers < ActiveRecord::Migration[6.1]
  def change

  	create_table :teams_users do |t|
      
      t.references :team
      t.references :user

    end
  end
end
