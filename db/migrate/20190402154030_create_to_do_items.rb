class CreateToDoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_items do |t|
      t.string :description
      t.string :priority
      t.boolean :checked, default: false

      t.belongs_to :user, foreign_key: true
      t.belongs_to :day, foreign_key: true

      t.timestamps
    end
  end
end
