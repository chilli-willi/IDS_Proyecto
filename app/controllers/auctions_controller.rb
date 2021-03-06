class AuctionsController < ApplicationController

def index
		@auction = Auction.all
		@tasks = if !params[:weekini].blank? and !params[:weekfin].blank?
          
        @NoPueden = Auction
        .where('weekdate BETWEEN ? AND ?', "#{params[:weekini]}", "#{params[:weekfin]}")
        #.pluck(:residence_id)
     	#@Sipueden = Residence.all.where.('id NOT IN (?)', Array.wrap(@NoPueden))
    	@Sipueden = Auction.where(id: @NoPueden)
     	@auction = @Sipueden 
     	end
    	
	end



	def create
		@auction = Auction.new(auction_params)
		@auction.user_id = 1
		if  ( Reservation.where(residence_id: @auction.residence_id, weekdate: @auction.weekdate).exists? or Hotsale.where(residence_id: @auction.residence_id, weekdate: @auction.weekdate).exists? or Auction.where(residence_id: @auction.residence_id, weekdate: @auction.weekdate).exists?)
			redirect_to auctions_path, notice: 'No puede crear subasta en esa fecha, ya esta reservada o en hotsale o en subasta'
		else 
			if @auction.save
			redirect_to auctions_path, notice: 'La subasta creada'
			else
				redirect_to auctions_path, notice: 'La subasta no tiene 6 meses de anticipacion'
			end
		end
	end

	
	def show
		@auction = Auction.find(params[:id])
	end


	def destroy
		@auction = Auction.find(params[:id])	
		if current_user.admin?
		  if @auction.user.id != 1
		    if @auction.user.creditos > 0
			  		@reservation = Reservation.new(residence: @auction.residence, user: @auction.user,  weekdate: @auction.weekdate, modo: "subasta")
					if @reservation.save
					   @auction.user.update(creditos: @auction.user.creditos - 1)
					   @auction.destroy
					   redirect_to auctions_path, notice: "Subasta vendida exitosamente"
					end
			  else
			    @auction.update( user_id: 1 ) 
			    redirect_to auctions_path, notice: "Error en la venta de subasta, pulse nuevamente para eliminar o espere a que otro usuario puje" 
			  end
		   else @auction.destroy
				redirect_to auctions_path, notice: "Nadie pujo, subasta eliminada" 
			 end
		end
	end


	def edit
		@auction = Auction.find(params[:id])
	end


	def update
		@auction = Auction.find(params[:id])
		
			if @auction.update( auction_params)
				redirect_to auctions_path, notice: 'La subasta modificada'
			else
				redirect_to auctions_path, notice: 'La subasta no tiene 6 meses de anticipacion'
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
