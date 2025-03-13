class Teacher < ApplicationRecord
  has_one_attached :photo
  validates :first_name, :last_name, presence: true

  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
