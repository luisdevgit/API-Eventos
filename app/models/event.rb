class Event < ApplicationRecord
    has_many :venues, dependent: :destroy
end
