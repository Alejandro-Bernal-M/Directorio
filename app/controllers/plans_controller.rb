class PlansController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :paypal_init, :except => [:index, :new, :create, :destroy, :edit, :update]
  def index
    @plans = Plan.all
  end

  def new; end

  def create
    if @super_user
      @plan = Plan.new(plan_params)

      if @plan.save 
        redirect_to superusers_path, notice: "Plan creado con exito"
      else
        redirect_to superusers_path, alert: "Error creando el plan"
      end
    else 
      redirect_to root_path, alert: "Error de autenticación"
    end

  end

  def destroy
    @plan = Plan.find(params[:id])
    
    if @plan.destroy
      redirect_to superuser_paths, notice: "Plan eliminado con exito"
    else
      redirect_to superuser_paths, alert: "Error eliminando el plan"
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    respond_to do |format|
      if @plan.update(plan_params)
        format.html{redirect_to superusers_path, notice: 'Plan actualizado'}
      else
        format.html{ render :edit, status: :unprocessable_entity}
      end
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def assign
    @plan= Plan.find(params[:id])
    @director = current_director
    @directorplan = @director.directors_plan
    ActiveRecord::Base.connection.execute("DELETE FROM directors_plans WHERE plan_id = #{@directorplan.plan_id} AND director_id = #{@director.id}")
    DirectorsPlan.create(plan: @plan, director: @director)
    @director.update(next_payment: 1.year.from_now);
    redirect_to director_path(current_director), notice: "Plan actualizado"
   
  end
  
  private
  def paypal_init
    client_id = Rails.application.credentials.paypal_client_id
    client_secret = Rails.application.credentials.paypal_client_secret
    environment = PayPal::SandboxEnvironment.new client_id, client_secret
    @client = PayPal::PayPalHttpClient.new environment
  end

  protected
  def plan_params
    params.require(:plan).permit(:name, :number_of_groups, :number_of_users_per_group, :color, :price)
  end
  
end