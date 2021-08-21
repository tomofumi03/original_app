class Event < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
end
