class AuctionsController < ApplicationController

def index
		@auction = Auction.all
	end


	def create
		@auction = Auction.new(params.require(:auction).permit(:name, :des, :monto, :minimapuja))
		if @auction.save
			redirect_to auctions_path, notice: 'Se creo la subasta piola'
		else
			render :new
		end
	end

	def show
		@auction = Auction.find(params[:id])
	end



	def destroy
		auction = Auction.find(params[:id])
		if auction.destroy
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
		if @auction.update(params.require(:auction).permit(:name, :des, :minimapuja, :monto))
			redirect_to auctions_path, notice: 'La subasta se modifico correctamente'
		end
	end

	def puja
		@auction = Auction.find(params[:id])
	end


	def new
		@auction = Auction.new
	end

end
