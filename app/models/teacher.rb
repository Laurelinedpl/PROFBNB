class Teacher < ApplicationRecord
  has_one_attached :photo
  validates :first_name, :last_name, presence: true

  has_many :bookings, dependent: :destroy
end
