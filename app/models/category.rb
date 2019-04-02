class Category < ApplicationRecord
  has_many :categorynotes, dependent: :destroy
  has_many :categorytodos, dependent: :destroy
  has_many :to_do_items, through: :categorytodos
  has_many :notes, through: :categorynotes
end
