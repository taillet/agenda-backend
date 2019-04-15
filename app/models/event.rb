class Event < ApplicationRecord
  belongs_to :user
  has_many :categoryevents, dependent: :destroy
end
