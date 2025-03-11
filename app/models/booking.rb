class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  STATUTS = %w[en_attente confirmée annulée]

  validates :date, presence: true
  validates :statut, inclusion: { in: STATUTS }
end
