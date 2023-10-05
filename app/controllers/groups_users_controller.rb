class GroupsUsersController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @request = Request.find(params[:request_id])
    @group_users = @group.users.size
    @max_number_of_users = @group.director.plan.number_of_users_per_group

    if @group_users + 1 >  @max_number_of_users
      redirect_to director_path(current_director), alert: 'Máximo de usuarios en el grupo alcanzado'
      return 
    end

    if @user.groups << @group
      flash[:notice]  = 'Usuario asignado al grupo'
      @request.destroy
    else 
      flash[:alert] = 'Error añadiendo al usuario'
    end
    redirect_to director_path(current_director)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    
    if @group.users.delete(@user)
      flash[:notice]  = 'Usuario eliminado del grupo'
    else 
      flash[:alert] = 'Error eliminando al usuario del grupo'
    end
    redirect_to director_path(current_director)
  end
end