class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      
      t.string :title
      t.text   :desctiption
      t.string :link_to_site
      t.string :link_to_manual
      t.string :state

      t.timestamps
    end
  end
end
