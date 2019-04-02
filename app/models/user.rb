class User < ApplicationRecord
  has_many :to_do_items, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :days, through: :to_do_items
  has_many :days, through: :notes
end
