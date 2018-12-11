class AuctionsController < ApplicationController

	def index
		@auction = Auction.all
	end


	def create
		@auction = Auction.new(auction_params)
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
		if @auction.destroy
			redirect_to auctions_path, notice: "La subasta fue borrada"
		else
			redirect_to auctions_path, notice: "La subasta no fue borrada"	
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
		params.require(:auction).permit(:weekdate, :residence_id, :monto, :minimapuja)
	end

	def new
		@auction = Auction.new
	end

end
