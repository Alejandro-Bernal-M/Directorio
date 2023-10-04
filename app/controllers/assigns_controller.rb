class AssignsController < ApplicationController
  def assign
    @director = Director.find(params[:director_id])
    @plan = Plan.find(params[:selected_plan_id])

    if @director.update(plan: @plan)
      redirect_to director_path(current_director), notice: "Plan asignado"
    else 
      redirect_to director_path(current_director), alert: "Error asignando el plan"
    end

  end
end