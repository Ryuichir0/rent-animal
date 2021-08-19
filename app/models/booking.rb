class Booking < ApplicationRecord
  belongs_to :herd
  belongs_to :user

  validates :check_in, presence: true
  validates :check_out, presence: true

  def start_time
    check_in
  end

  def end_time
    check_out
  end
end
