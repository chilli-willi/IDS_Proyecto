class HotsalesController < ApplicationController

	def index
		@hotsale = Hotsale.all
	end

	def new
		@hotsale = Hotsale.new
	end

	def create
		@hotsale = Hotsale.new(params.require(:hotsale).permit(:weekdate, :residence_id, :price))			
			if  ( Reservation.where(residence_id: @hotsale.residence_id, weekdate: @hotsale.weekdate).exists? or Auction.where(residence_id: @hotsale.residence_id, weekdate: @hotsale.weekdate).exists?)
				redirect_to hotsales_path, notice: 'No puede crear hotsale en esa fecha, ya esta reservada o en subasta'
			else 
				@hotsale.save
				redirect_to hotsales_path, notice: 'Se creo la hotsale'
			end
	end

	def show
		@hotsale = Hotsale.find(params[:id])
	end


	def destroy
		@hotsale = Hotsale.find(params[:id])
		
		if current_user.present? && !current_user.admin?
			@reservation = Reservation.new(residence: @hotsale.residence, user: current_user,  weekdate: @hotsale.weekdate, modo: "hotsale")
			if @reservation.save
				redirect_to hotsales_path, notice: "Hotsale comprado exitosamente"
			else redirect_to hotsales_path, notice: "Hotsale terminado, alguien ya lo compro"	end
		end
		@hotsale.destroy
		if current_user.admin?
			redirect_to hotsales_path	, notice: "Hotsale se borro"
		end

	end


	def edit
		@hotsale = Hotsale.find(params[:id])
	end


	def update
		@hotsale = Hotsale.find(params[:id])
		if @hotsale.update(params.require(:hotsale).permit(:weekdate, :residence_id, :price))
			redirect_to hotsales_path, notice: 'La hotsale se modifico correctamente'	
	end

	end


end


