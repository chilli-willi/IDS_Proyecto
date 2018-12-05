class UsersController < ApplicationController

	def show
	@user = User.find(params[:id])
  
	end

 def indexAdmins
    @admin = User.admins
  end

  def new
  	@user = User.new
  end

  def newAdmin
    @admin = User.new
  end

  def create
    @user = User.new( params.require(:user).permit(:userName, :email, :password, :credits, :admin) )
    if @user.save
        redirect_to users_path, notice: "Se añadio un usuario exitosamente."
    else
      render :new
    end
  end

  def createAdmin
    @admin = User.new( params.require(:user).permit(:userName, :email, :password, :credits, :admin) )
    if @admin.save
      redirect_to admins_path, notice: "Se añadio un admin exitosamente."
    else
      @error = "Contrasena muy debil"
      render :newAdmin
    end
  end

  def show
  	@user = User.find(params[:id])
    @auctions = @user.auctions
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to users_path
  end

  def destroyAdmin
    @admin = User.destroy(params[:id])
    redirect_to admins_path
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  #Usado para mandar parametros del usuario. Lo uso en la modificacion del usuario para actualizar los datos.
  #Se puede usar para otros metdos, como por ej. create.
  def user_params
    params.require(:user).permit(:userName, :email, :password, :credits)
  end

  def be_premium
    @user = User.find(params[:id])
  end

  def apply_premium
    @user = User.find(params[:id])
    @user.premium = "solicitado"
    @user.save
    redirect_to current_user, notice: 'Su solicitud ha sido enviada con exito.'
  end

  def enable_premium
    @user = User.find(params[:id])
    @user.premium = "si"
    @user.save
    redirect_to users_path
  end

  def disable_premium
    @user = User.find(params[:id])
    @user.premium = "no"
    @user.save
    redirect_to users_path
  end


end