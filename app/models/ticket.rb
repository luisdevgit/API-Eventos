class Ticket < ApplicationRecord
  belongs_to :venue
  before_validation :venue_capacity
  
  private
   
  def venue_capacity  
      total = Ticket.where(venue_id: self.venue).count 
      capacity = self.venue.capacity 
      total = total + 1
      if total <= capacity
          true
      else 
          errors.add(:venue_capacity, 'excede la capacidad de la sede.')
      end
  end
  
end
