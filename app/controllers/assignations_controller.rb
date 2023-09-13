class AssignationsController < ApplicationController
  def destroy
    @request = Request.find(params[:request_id])
    if @request.destroy
      flash[:notice]  = 'Solicitud eliminada'
    else 
      flash[:alert] = 'Error eliminando la solicitud'
    end
    redirect_to director_path(current_director)
  end
end