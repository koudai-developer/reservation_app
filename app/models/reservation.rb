class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :guests_count, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validate :out_after_in

  def out_after_in
    return if check_out_date.blank? || check_in_date.blank?

    if check_out_date < check_in_date
      errors.add(:check_out_date, "はチェックイン日時より後に設定してください")
    end
  end

end
