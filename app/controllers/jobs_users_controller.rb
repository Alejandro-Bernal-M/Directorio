class JobsUsersController < ApplicationController
  def new
    @user = current_user
    @jobs = Job.all
  end

  def create
    @user = current_user
    @job = Job.find(params[:job][:job_id])

    if @user.jobs << @job
      flash[:notice] = 'Trabajo añadido.'
    else
      flash[:alert] = 'Error añadiendo el trabajo.'
    end
    
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = current_user
    if @user.jobs.delete(Job.find(params[:id]))
      flash[:notice] = 'Trabajo Eliminado.'
    else
      flash[:alert] = 'Error eliminando el trabajo.'
    end
    
    redirect_to user_path(@user)
  end
end
