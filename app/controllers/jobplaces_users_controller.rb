class JobplacesUsersController < ApplicationController
  def create
    @user = current_user
    @jobplace = Jobplace.find(params[:jobplace][:jobplace_id])

    if @user.jobplaces << @jobplace
      flash[:notice] = 'Lugar de trabajo añadido.'
    else
      flash[:alert] = 'Error añadiendo el lugar de trabajo.'
    end
    
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = current_user
    if JobplacesUser.find(params[:id]).destroy
      flash[:notice] = 'Lugar de trabajo Eliminado.'
    else
      flash[:alert] = 'Error eliminando el lugar de trabajo.'
    end
    
    redirect_to user_path(@user)
  end
end