class Contact < ApplicationRecord
  validates :user, 
            presence: true
  validates :email, 
            presence: true
end
