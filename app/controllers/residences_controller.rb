class ResidencesController < ApplicationController
	
	def residence_params
	  params.require(:residence).permit(:name, :term)
	end

	def index
		@residences = Residence.all
	  	@tasks = if !params[:weekini].blank? and !params[:weekfin].blank?
	      			@NoPueden = Reservation.all.where('weekdate BETWEEN ? AND ?', "#{params[:weekini]}", "#{params[:weekfin]}").select('residence_id').collect(&:residence_id)
					@Sipueden = Residence.all.where('id NOT IN (?)', Array.wrap(@NoPueden))
					@residences = @Sipueden	
				#else 
				#	flash[:notice] = 'Inicial menor de 6 meses' end
				end

				if !params[:term].blank?
					if @Sipueden != nil
						@residences = @Sipueden.where('name ILIKE ? OR pais ILIKE ? OR localidad ILIKE ? OR provincia ILIKE ? OR des ILIKE ? ', "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%")
	  				else 
	  					@residences = Residence.all.where('name ILIKE ? OR pais ILIKE ? OR localidad ILIKE ? OR provincia ILIKE ? OR des ILIKE ? ', "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%")
	  				end
	   			end	   
	end

	def create
		@residence = Residence.new(params.require(:residence).permit(:name, :des, :location, :pais, :provincia, :localidad))
		if @residence.save
			redirect_to residences_path, notice: 'Se creo la residencia'
		else
			render :new
		end
	end

	def show
		@residence = Residence.find(params[:id])
	end

	def destroy
		residence = Residence.find(params[:id])
		if residence.destroy
			redirect_to residences_path, notice: "La residencia fue borrada"
		else
			redirect_to residences_path, notice: "La residencia no fue borrada"	
		end
	end


	def edit
		@residence = Residence.find(params[:id])
	end


	def update
		@residence = Residence.find(params[:id])
		if @residence.update(params.require(:residence).permit(:name, :des, :location, :pais, :provincia, :localidad))
			redirect_to residences_path, notice: 'La residencia se modifico correctamente'
		end
	end


	def new
		@residence = Residence.new
	end
end
