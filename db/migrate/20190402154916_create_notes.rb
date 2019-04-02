class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.belongs_to :day, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
