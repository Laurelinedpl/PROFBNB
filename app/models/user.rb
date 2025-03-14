class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :teachers, through: :bookings
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :first_name, :last_name, :email, :password, presence: true
  #validates :email, uniqueness: true
  #validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }
end
