class ProfessionsController < ApplicationController
  def create
    @profession = Profession.new(name: params[:profession][:name])
    if @profession.save
      flash[:notice] = 'Profesión guardada.'

    else
      flash[:alert] = 'Error.'
    end
    redirect_to user_path(current_user)
  end

  def destroy
  end
end