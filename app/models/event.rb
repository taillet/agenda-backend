class Event < ApplicationRecord
  belongs_to :user
  belongs_to :day
  has_many :categoryevents, dependent: :destroy
end
