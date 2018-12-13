class ResidencesController < ApplicationController
	
	def residence_params
	  params.require(:residence).permit(:name, :term)
	end

	def index
	  	@tasks = if params[:term]
	    @residences = Residence.where('name LIKE ? OR pais LIKE ? OR localidad LIKE ? OR provincia LIKE ? ', "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%")
	  	@reservation = Reservation.where(residence_id: params[:id], weekdate: params[:term])
	  else
	    @residences = Residence.all
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
