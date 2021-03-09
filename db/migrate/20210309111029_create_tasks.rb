class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      
      t.string  :title
      t.text    :description
      t.date    :data_end
      t.integer :hours
      t.integer :position
      t.string  :state

      t.references :list,      null: false, foreign_key: true
      t.references :owner,     null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true
      t.references :project,   null: false, foreign_key: true
      t.references :section,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
