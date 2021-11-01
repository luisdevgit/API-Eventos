class Event < ApplicationRecord
  has_many :venues, dependent: :destroy
    
  include AASM

  aasm :column => 'state' do
      state :published, initial: true
      state :pre_sold, :sold, :cancelled, :completed

      
    event :presale do
      transitions from: :published, to: :pre_sold
    end

    event :sell do
      transitions from: :pre_sold, to: :sold
    end

    event :cancel do
      transitions from: [:published, :pre_sold, :sold], to: :cancelled
    end
    
    event :complete do
      transitions from: [:pre_sold, :sold], to: :completed
    end
    
  end
  
end
