class RequestsController < ApplicationController
  def index; end
  def show; end
  def create
    @request = Request.new(request_params)
  
    if @request.save
      flash[:notice] = 'Solicitud enviada'
      redirect_to user_path(current_user)
    else
      flash[:notice] = 'La solicitud ya existe'
      redirect_back fallback_location: user_path(current_user)
    end
  end
  def update; end
  def destroy; end

  private

  def request_params
    params.require(:request).permit(:group_id, :user_id)
  end

end