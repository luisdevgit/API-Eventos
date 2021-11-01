class Venue < ApplicationRecord
  belongs_to :event
   has_many :tickets, dependent: :destroy
end
