class Booking < ApplicationRecord
  belongs_to :teacher
  belongs_to :user

  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending confirmed cancelled] }
  validates :teacher_id, presence: true
  validates :user_id, presence: true
end
