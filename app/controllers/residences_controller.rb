class ResidencesController < ApplicationController
	def index
		@residences = Residence.all
	end


	def create
		@residence = Residence.new(params.require(:residence).permit(:name, :des, :location))
		if @residence.save
			redirect_to residences_path, notice: 'Se creo la residencia piola'
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
		if @residence.update(params.require(:residence).permit(:name, :des, :location))
			redirect_to residences_path, notice: 'La residencia se modifico correctamente'
		end
	end


	def new
		@residence = Residence.new
	end
end
