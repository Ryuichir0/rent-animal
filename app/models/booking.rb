class Booking < ApplicationRecord
  belongs_to :herd
  belongs_to :user
end
