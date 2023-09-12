class JobplacesController < ApplicationController
  def create
    @jobplace = Jobplace.new(name: params[:jobplace][:name], city: params[:jobplace][:city])
    if @jobplace.save
      flash[:notice] = 'Lugar de trabajo guardado.'

    else
      flash[:alert] = 'Error.'
    end
    redirect_to user_path(current_user)
  end

  def destroy
  end
end