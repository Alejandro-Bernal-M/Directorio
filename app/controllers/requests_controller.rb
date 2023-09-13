class RequestsController < ApplicationController
  def index; end
  def show; end
  def create
    @request = Request.new(request_params)
    @group = Group.find(@request.group_id)
    if @group.users.exists?(id: @request.user_id)
      flash[:notice] = 'Ya perteneces al grupo'
      redirect_to user_path(current_user)
      return
    end

    if @request.save
      flash[:notice] = 'Solicitud enviada'
    else
      flash[:notice] = 'La solicitud ya existe'
    end
    redirect_to user_path(current_user)
  end
  def update; end
  def destroy; end

  private

  def request_params
    params.require(:request).permit(:group_id, :user_id)
  end

end