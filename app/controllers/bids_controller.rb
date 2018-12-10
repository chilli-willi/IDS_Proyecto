class BidsController < ApplicationController
	def new
		@bid = Bid.new(params.require(:bid).permit(:maxbid, :user_id, :residence_id, :auction_id))
	end

end


