class HotsalesController < ApplicationController

def index
		@hotsale = Hotsale.all
	end


	def create
		@hotsale = Hotsale.new(params.require(:hotsale).permit(:weekdate, :residence_id, :price))
		if (Reservation.exists?('SELECT * FROM WHERE residence_id LIKE "%#{@hotsale.residence_id}%" AND weekdate LIKE "%#{@hotsale.weekdate}%"') or Auction.exists?('SELECT * FROM WHERE residence_id LIKE "%#{@hotsale.residence_id}%" AND weekdate LIKE "%#{@hotsale.weekdate}%"'))
		   	@hotsale.save
		   	redirect_to hotsales_path, notice: 'Se creo hotsale '
		else
			redirect_to hotsales_path, notice: 'Fecha reservada, no se creo hotsale'
		end
	end

	def show
		@hotsale = Hotsale.find(params[:id])
	end


	def destroy
		@hotsale = Hotsale.find(params[:id])
		if @hotsale.destroy
			redirect_to hotsales_path, notice: "La hotsale fue borrada"
		else
			redirect_to hotsales_path, notice: "La hotsale no fue borrada"	
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


	def new
		@hotsale = Hotsale.new
	end

end


