class GroupsController < ApplicationController
  before_action :check_logged 

  def check_logged
    unless current_director || current_user
      flash[:notice] = 'Inicia sesión primero'
      redirect_to root_path
    end
  end

  def index; end

  def show
    @group = Group.includes(:users).find(params[:id])
    @director = @group.director
    @users = @group.users
  end
end