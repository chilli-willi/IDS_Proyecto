class ReservationsController < ApplicationController

def new
  	@reservation = Reservation.new()  	 	
end
 

def create
	@reservation = Reservation.new( reservation_params )
    @u = User.find(@reservation.user_id)
   if @reservation.modo == "hotsale"
		if @reservation.save
		  	redirect_to  home_index_path, notice: 'Reservaste la residencia exitosamente'
		else 
			redirect_to  residences_path, notice: 'Fecha imposible de reservar, vuelva a intentar con otra'
		end
	else
		if @u.creditos > 0
		   if Hotsale.where(residence_id: @reservation.residence_id, weekdate: @reservation.weekdate).exists?
			  redirect_to  home_index_path, notice: 'Fecha en hotsale, no puede reservar'
		   else
				if  @reservation.save
				  	@u.update(creditos: @u.creditos - 1)
			      	redirect_to  home_index_path, notice: 'Reservaste la residencia exitosamente'
				else 
					redirect_to  home_index_path, notice: 'Fecha imposible de reservar, vuelva a intentar'
				end
			end
		end	
	end
end

def destroy
	reservation = Reservation.find(params[:id])
	if reservation.modo == "hotsale"
		if reservation.destroy
		  	redirect_to  home_index_path, notice: 'Cancelaste la reserva exitosamente'
		else 
			redirect_to  home_index_path, notice: 'Reserva no fue cancelada'
		end
	else
		if reservation.destroy
			  	current_user.update(creditos: current_user.creditos + 1)
		      	redirect_to  home_index_path, notice: 'Cancelaste la reserva exitosamente'
		else 
			redirect_to  home_index_path, notice: 'Reserva no fue cancelada'
		end
	end	
end


def reservation_params
	 params.require(:reservation).permit(:modo, :weekdate, :user_id, :residence_id)
end


end
