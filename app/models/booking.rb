class Booking < ApplicationRecord
  STATUS = ['Pending', 'Confirmed', 'Cancelled']

  belongs_to :user
  belongs_to :teacher

  validates :date, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :teacher_id, presence: true
  validates :user_id, presence: true
end
