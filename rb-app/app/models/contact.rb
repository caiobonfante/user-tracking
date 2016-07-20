class Contact < ApplicationRecord
  validates :user, presence: true
            :email, presence: true
end
