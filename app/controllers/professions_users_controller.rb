class ProfessionsUsersController < ApplicationController
  def new
    @user = current_user
    @professions = Profession.all
  end

  def create
    @user = current_user
    @profession = Profession.find(params[:profession][:profession_id])

    if @user.professions << @profession
      flash[:notice] = 'Profesión añadida.'
    else
      flash[:alert] = 'Error añadiendo la profesión.'
    end
    
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = current_user
    if ProfessionsUser.find(params[:id]).destroy
      flash[:notice] = 'Profesión Eliminada.'
    else
      flash[:alert] = 'Error eliminando el cargo.'
    end
    
    redirect_to user_path(@user)
  end
end