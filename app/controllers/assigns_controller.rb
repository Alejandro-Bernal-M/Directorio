class AssignsController < ApplicationController
  def assign
    @director = Director.find(params[:director_id])
    @plan = Plan.find(params[:selected_plan_id])

    @directorplan = @director.directors_plan

    if @directorplan
      if @directorplan.plan == @plan
        redirect_to director_path(current_director), alert: "Este es su plan actual"
      else
        ActiveRecord::Base.connection.execute("DELETE FROM directors_plans WHERE plan_id = #{@directorplan.plan_id} AND director_id = #{@director.id}")
        DirectorsPlan.create(plan: @plan, director: @director)
        redirect_to director_path(current_director), notice: "Plan actualizado"
        @director.update(next_payment: 1.year.from_now);
      end
    else
      @director.build_directors_plan(plan: @plan)
      if @director.save
        redirect_to director_path(current_director), notice: "Plan asignado"
      else
        redirect_to director_path(current_director), alert: "Error asignando el plan"
      end
    end
  end
end
