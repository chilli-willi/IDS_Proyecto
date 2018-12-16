class HotsalesController < ApplicationController

	def index
		@hotsale = Hotsale.all
		@tasks = if !params[:weekini].blank? and !params[:weekfin].blank?
          
        @NoPueden = Hotsale
        .where('weekdate BETWEEN ? AND ?', "#{params[:weekini]}", "#{params[:weekfin]}")
        #.pluck(:residence_id)
     	#@Sipueden = Residence.all.where.('id NOT IN (?)', Array.wrap(@NoPueden))
    	@Sipueden = Hotsale.where(id: @NoPueden)
     	@hotsale = @Sipueden 
     	end
    	
	end
 	
	def new
		@hotsale = Hotsale.new
	end

	def create
		@hotsale = Hotsale.new(params.require(:hotsale).permit(:weekdate, :residence_id, :price))			
			if  ( Reservation.where(residence_id: @hotsale.residence_id, weekdate: @hotsale.weekdate).exists? or Auction.where(residence_id: @hotsale.residence_id, weekdate: @hotsale.weekdate).exists? or Hotsale.where(residence_id: @hotsale.residence_id, weekdate: @hotsale.weekdate).exists? )
				redirect_to hotsales_path, notice: 'No puede crear hotsale en esa fecha, ya esta reservada o en subasta'
			else 
				if @hotsale.save
					redirect_to hotsales_path, notice: 'Se creo la hotsale'
				else redirect_to hotsales_path, notice: 'No puedes crear en fechas que ya pasaron o mayores a 6 meses' end
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
			else 
				redirect_to hotsales_path, notice: "Hotsale terminado, alguien ya lo compro"	end
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
				redirect_to hotsales_path, notice: 'Se actualizo hotsale'
			else redirect_to hotsales_path, notice: 'No se actualizo hotsale' end
			end
		
	end


