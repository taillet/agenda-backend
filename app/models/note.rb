class Note < ApplicationRecord
  belongs_to :day
  belongs_to :user
  has_many :categorynotes, dependent: :destroy
end
