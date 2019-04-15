class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :start, index: true
      t.integer :end, index: true
      t.boolean :checked, default: false
      t.string :priority
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
