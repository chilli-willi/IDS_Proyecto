class ReservationsController < ApplicationController


def new
  	@reservation = Reservation.new()  	 	
end
 

def create
		@reservation = Reservation.new( reservation_params )
		
		if @reservation.save
	    redirect_to  home_index_path, notice: 'Reservaste la residencia exitosamente'
		else 
			redirect_to  home_index_path, notice: 'Fecha imposible de reservar, vuelva a intentar'
		end
	end


def reservation_params
	 params.require(:reservation).permit( :weekdate, :user_id, :residence_id)
end


end