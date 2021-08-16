class Herd < ApplicationRecord
  belongs_to :user

  validates :unit_price, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
end
