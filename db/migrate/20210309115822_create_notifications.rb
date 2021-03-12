class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      
      t.string     :title
      t.text       :text
      t.string     :status
      
      t.references :target, null: false, foreign_key: { to_table: :users }
      t.references :task  , null: false, foreign_key: true

      t.references :object, null: false, polymorphic: true

      t.timestamps
    end
  end
end
