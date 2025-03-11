class Teacher < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
