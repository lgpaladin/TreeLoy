class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      
      t.string  :title
      t.string  :state
      t.integer :hours
      t.date    :data_end
      t.integer :position
      t.text    :description

      t.references :list, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :project, null: false, foreign_key: true
      t.references :section, null: true, foreign_key: true
      t.references :developer, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
