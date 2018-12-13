class AuctionsController < ApplicationController

	def index
		@auction = Auction.all
	end


	def create
		@auction = Auction.new(auction_params)
		@auction.user_id = 1
		if @auction.save
			redirect_to auctions_path, notice: 'Se creo la subasta exitosamente'
		else
			redirect_to auctions_path, notice: 'La subasta debe tener 6 meses de anticipacion'
		end
	end

	
	def show
		@auction = Auction.find(params[:id])
	end


	def destroy
		@auction = Auction.find(params[:id])	
		if current_user.admin?
		  if @auction.user.creditos > 0
		  		@reservation = Reservation.new(residence: @auction.residence, user: @auction.user,  weekdate: @auction.weekdate, modo: "subasta")
				if @reservation.save
				   @auction.user.update(creditos: @auction.user.creditos - 1)
				   @auction.destroy
				   redirect_to auctions_path, notice: "Subasta vendida exitosamente"
				end
		  else 
			redirect_to auctions_path, notice: "Error en la venta de subasta, usuario sin creditos" 
		  end
		end
	end


	def edit
		@auction = Auction.find(params[:id])
	end


	def update
		@auction = Auction.find(params[:id])
		if @auction.update(auction_params)
			redirect_to auctions_path, notice: 'Su puja se guardo correctamente'
		
	end

	end

	def auction_params
		params.require(:auction).permit(:name, :user_id, :weekdate, :residence_id, :monto, :minimapuja)
	end

	def new
		@auction = Auction.new
	end

	def finalizar
	    @auction = Auction.find(params[:id])
	    @auction.name = "finalizada"
	    @auction.save
	    redirect_to auctions_path, notice: 'Su solicitud ha sido enviada con exito.'
  end


end
