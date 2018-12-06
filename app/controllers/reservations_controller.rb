class ReservationsController < ApplicationController


def new
  	@reservation = Reservation.new()  	 	
end
 

def create
		
		@reservation = Reservation.new( reservation_params )
		
		@reservation.save
	    redirect_to  home_index_path, notice: 'Reservaste la residencia exitosamente'
		
	end


def reservation_params
	 params.require(:reservation).permit( :user_id, :residence_id)
end

end