class Categoryevent < ApplicationRecord
  belongs_to :category
  belongs_to :event
end
