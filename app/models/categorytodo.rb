class Categorytodo < ApplicationRecord
  belongs_to :category
  belongs_to :to_do_item
end
