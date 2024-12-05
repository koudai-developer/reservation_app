class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :description, :price, :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
