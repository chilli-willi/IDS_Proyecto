class BidsController < ApplicationController
	def new
		@bid = Bid.new()
	end

	def index
		@bid = Bid.all
	end

	def show
		@bid = Bid.find(params[:id])
	end

	def create
		@bid = Bid.new(bid_params)
		if @bid.save
			redirect_to bids_path, notice: 'Se pujo exitosamente'
		else
			redirect_to bids_path, notice: 'NO se pujo'
		end
	end

	def bid_params
	     params.require(:bid).permit(:maxbid, :user_id, :residence_id, :auction_id)
	end
end


