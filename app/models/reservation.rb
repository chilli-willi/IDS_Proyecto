class Reservation < ApplicationRecord
	
	validates :weekdate, uniqueness: true
	
	enum modo: { reserva: 0, subasta: 1, hotsale: 2 }
	 
	belongs_to :user
	belongs_to :residence
end
