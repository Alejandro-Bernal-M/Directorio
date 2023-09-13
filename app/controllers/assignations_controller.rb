class AssignationsController < ApplicationController
  def assign
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    if @user.groups << @group
      flash[:notice]  = 'Usuario asignado al grupo'
      @request.destroy
      redirect_to director_path(director)
    else 
      flash[:alert] = 'Error añadiendo al usuario'
    end
  end
end