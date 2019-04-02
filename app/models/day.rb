class Day < ApplicationRecord
  has_many :to_do_items, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :users, through: :to_do_items
  has_many :users, through: :notes
end
