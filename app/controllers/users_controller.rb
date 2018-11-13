class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:name, :password, :range))
		if @user.save
			redirect_to residences_path, notice: 'Se creo el user'
		else
			render :new
		end
	end

end
