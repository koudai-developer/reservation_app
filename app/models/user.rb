class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
