class Access < ApplicationRecord
  validates :user,
            presence: true

  validates :url,
            presence: true

  validates :date,
            presence: true

end
