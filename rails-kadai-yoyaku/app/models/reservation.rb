class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :number_of_reservations, numericality: {greater_than_or_equal_to: 1}
  end

  validate :start_end_check
  def start_end_check
    if self.start_date.nil?
    elsif self.end_date.nil?
    else
      errors.add(:end_date) unless
      self.start_date < self.end_date
    end
  end

  validate :date_before_start
  def date_before_start
    if self.start_date.nil?
    else
      errors.add(:start_date) if
      start_date < Date.today
    end
  end
end
