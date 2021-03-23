class AddHbtmWithTasksforUsers < ActiveRecord::Migration[6.1]
  def change

  	create_table :tasks_users do |t|
      
      t.references :user
      t.references :task

    end
  end
end
