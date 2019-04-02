class CreateCategorynotes < ActiveRecord::Migration[5.2]
  def change
    create_table :categorynotes do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :note, foreign_key: true

      t.timestamps
    end
  end
end
