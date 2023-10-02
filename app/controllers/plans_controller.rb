class PlansController < ApplicationController
  
  def index; end

  def new; end

  def create
    if @super_user
      @plan = Plan.new(plan_params)

      if @plan.save 
        redirect_to superuser_path(current_director), notice: "Plan creado con exito"
      else
        redirect_to superuser_path, alert: "Error creando el plan"
      end
    else 
      redirect_to root_path, alert: "Error de autenticación"
    end

  end

  def destroy; end

  def update; end

  protected

  def plan_params
    params.require(:plan).permit(:name, :number_of_groups, :number_of_users_per_group)
  end
end