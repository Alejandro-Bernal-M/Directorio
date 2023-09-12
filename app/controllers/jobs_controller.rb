class JobsController < ApplicationController
  def index; end
  def create
    @job = Job.new(name: params[:job][:name])
    if @job.save
      flash[:notice] = 'Trabajo guardado.'

    else
      flash[:alert] = 'Error.'
    end
    redirect_to user_path(current_user)
  end
end