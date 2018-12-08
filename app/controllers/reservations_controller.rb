class ReservationsController < ApplicationController

def new
  	@reservation = Reservation.new()  	 	
end
 

def create
	@reservation = Reservation.new( reservation_params )
   
   if @reservation.modo == "hotsale"
		if @reservation.save
		  	redirect_to  home_index_path, notice: 'Reservaste la residencia exitosamente'
		else 
			redirect_to  home_index_path, notice: 'Fecha imposible de reservar, vuelva a intentar'
		end
	else
		if current_user.creditos > 0
			if @reservation.save
			  	current_user.update(creditos: current_user.creditos - 1)

		      	redirect_to  home_index_path, notice: 'Reservaste la residencia exitosamente'
			else 
				redirect_to  home_index_path, notice: 'Fecha imposible de reservar, vuelva a intentar'
			end
		end	
	end
end

def reservation_params
	 params.require(:reservation).permit(:modo, :weekdate, :user_id, :residence_id)
end


end
