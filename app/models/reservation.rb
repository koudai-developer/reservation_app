class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :guests_count, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validate :check_out_after_check_in

  private

  def check_out_after_check_in
    if check_in_date.present? && check_out_date.present? && check_out_date <= check_in_date
      errors.add(:check_out_date, "はチェックイン日より後の日付を選択してください")
    end
  end

end
