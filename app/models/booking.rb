class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending confirmed cancelled] }
  validates :teacher_id, presence: true
  validates :user_id, presence: true
end
