class UserJobsController < ApplicationController
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
      flash[:error] = 'Error añadiendo el trabajo.'
    end

    redirect_to user_path(@user)
  end
end
