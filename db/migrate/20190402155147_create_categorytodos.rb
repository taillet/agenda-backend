class CreateCategorytodos < ActiveRecord::Migration[5.2]
  def change
    create_table :categorytodos do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :to_do_item, foreign_key: true

      t.timestamps
    end
  end
end
