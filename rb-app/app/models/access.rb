class Access < ApplicationRecord
  validates :user, presence: true
            :url, presence: true
            :date, presence: true
end
