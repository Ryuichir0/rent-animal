class Herd < ApplicationRecord
  belongs_to :user

  validates :unit_price, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :address, presence: true
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
