class CreateToDoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_items do |t|
      t.string :title
      t.string :description
      t.boolean :checked, default: false 
      t.datetime :start
      t.datetime :end
      t.string :priority
      t.belongs_to :user, foreign_key: true
      t.belongs_to :day, foreign_key: true

      t.timestamps
    end
  end
end
