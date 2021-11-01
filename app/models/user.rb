class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :role, optional: true
  
  def assign_role
    self.role = Role.find_by name: 'Buyer' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end
  
  def organizer?
    role.name == 'Organizer'
  end

  def buyer?
    role.name == 'Buyer'
  end
  
  
end
