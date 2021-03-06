class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_length_of :card, minimum: 16
  validates_length_of :cvv, minimum: 3
  validates :age, :presence => true
  validate :validate_age

  private

  def validate_age
      if age.present? && age > 18.years.ago.to_date
          errors.add(:age, 'Debes ser mayor de 18 años.')
      end
  end

  enum premium: { si: 0, solicitado: 1, no: 2 }

  scope :admins, -> {where(admin: 1)}
 
  has_many :reservations
  has_many :auctions
end
