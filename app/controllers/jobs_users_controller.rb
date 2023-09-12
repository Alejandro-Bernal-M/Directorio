class JobsUsersController < ApplicationController
  def new
    @user = current_user
    @jobs = Job.all
  end

  def create
    @user = current_user
    @job = Job.find(params[:job][:job_id])

    if @user.jobs << @job
      flash[:notice] = 'Cargo añadido.'
    else
      flash[:alert] = 'Error añadiendo el cargo.'
    end
    
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = current_user
    if JobsUser.find(params[:id]).destroy
      flash[:notice] = 'Cargo Eliminado.'
    else
      flash[:alert] = 'Error eliminando el cargo.'
    end
    
    redirect_to user_path(@user)
  end
end
