class Booking < ApplicationRecord
  belongs_to :herd
  belongs_to :user

  validates :check_in, presence: true, uniqueness: true
  validates :check_out, presence: true, uniqueness: true

  def start_time
    check_in
  end

  def end_time
    check_out
  end

  def total_amount
    return (check_out - check_in) / 86_400 * herd.unit_price
  end

  def days_booked
    return (check_out - check_in) / 86_400
  end
end
