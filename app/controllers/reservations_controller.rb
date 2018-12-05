class ReservationsController < ApplicationController
attr_reader :reservation

def new

  	@reservation = Reservation.new()
  	@reservation.residence_id = params[:residence_id]
  end
 
 def create
  	@reservation = Reservation.new(reservation_params)
  	@reservation.user_id = current_user.id
  	@reservation.residence_id = params[:residence_id]
  	@reservation.save

  	redirect_to home_index_path, notice: 'Reservaste la residencia exitosamente'
 end

 def reservation_params
  params.permit(:user_id, :residence_id)
 end

end

