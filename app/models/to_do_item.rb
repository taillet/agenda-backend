class ToDoItem < ApplicationRecord
  belongs_to :user
  belongs_to :day
  has_many :categorytodos, dependent: :destroy
end
