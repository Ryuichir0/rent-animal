class Herd < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :unit_price, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
