class Teacher < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :bookings, dependent: :destroy
end
