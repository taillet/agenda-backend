class Categorynote < ApplicationRecord
  belongs_to :category
  belongs_to :note
end
