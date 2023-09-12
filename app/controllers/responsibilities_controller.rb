class ResponsibilitiesController < ApplicationController
  def index
    @responsabilities = Responsibility.where(jobs_user_id: params[:jobs_user_id])
  end

  def create
    @job = JobsUser.find_by(id: params[:jobs_user_id])
    @responsibility = Responsibility.new(description: params[:responsibility][:description], jobs_user_id: @job.id)
    if @job.responsibilities << @responsibility
      flash[:notice] = 'Función añadida.'
    else
      flash[:alert] = 'Error añadiendo la función.'
    end
    
    redirect_to user_path(current_user) 
  end
end