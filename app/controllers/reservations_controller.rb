class ReservationsController < ApplicationController


def new

	@reservation = Reservation.new(params.permit(:residence_id,:user_id))
	@reservation.residence_id = Residence.find(params[:id])
	
  	if @reservation.save

  	redirect_to home_index_path, notice: 'Reservaste la residencia exitosamente'
  else 
  	render :new
  end
 end

end

