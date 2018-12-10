class AuctionsController < ApplicationController

	def index
		@auction = Auction.all
	end


	def create
		@auction = Auction.new(auction_params)
		if @auction.save
			redirect_to auctions_path, notice: 'Se creo la auction exitosamente'
		else
			redirect_to auctions_path, notice: 'NO Se creo la auction'
		end
	end

	def show
		@auction = Auction.find(params[:id])
	end


	def destroy
		@auction = Auction.find(params[:id])
		if @auction.destroy
			redirect_to auctions_path, notice: "La auction fue borrada"
		else
			redirect_to auctions_path, notice: "La auction no fue borrada"	
		end
	end


	def edit
		@auction = Auction.find(params[:id])
	end


	def update
		@auction = Auction.find(params[:id])
		if @auction.update(auction_params)
			redirect_to auctions_path, notice: 'La auction se modifico correctamente'
		
	end

	end

	def auction_params
		params.require(:auction).permit(:weekdate, :residence_id, :monto, :minimapuja)
	end

	def new
		@auction = Auction.new
	end

end
