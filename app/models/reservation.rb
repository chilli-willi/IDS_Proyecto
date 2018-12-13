class Reservation < ApplicationRecord
	
	validates :weekdate, uniqueness: true
	validate :validate_week

  private

  def validate_week
  	  date = DateTime.parse(weekdate)
      if date.present? && date < Date.today + 6.month
          errors.add(:weekdate, 'Debes reservar con 6 meses de anticipacion')
      end
  end

	enum modo: { reserva: 0, subasta: 1, hotsale: 2 }
	 
	belongs_to :user
	belongs_to :residence
	
end
