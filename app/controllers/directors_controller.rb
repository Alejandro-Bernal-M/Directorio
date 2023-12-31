class DirectorsController < ApplicationController
  before_action :authenticate_director, only: [:show]

  def show
    @plans = Plan.all
    @users = User.all
    @director = Director.find(params[:id])
    @max_number_of_groups = @director.plan.number_of_groups if @director.plan
    @groups = Group.where(director_id: @director.id).order(:created_at)
    @groups_with_requests = @groups.map do |group|
      {
        group_members: group.users,
        group_name: group.name,
        group_color: group.color,
        group_slogan: group.slogan,
        group_id: group.id,
        requests: group.requests.map {|request| {user: @users.find_by(id: request.user_id), request_id: request.id}}
      }
    end
    @director.update(next_payment: Time.current) if @director.next_payment.nil?

  # rescue ActiveRecord::RecordNotFound
  #   render html: '<h1>Not found</h1>'.html_safe
  end

  def new; end

  def create
    @director = Director.new(director_params)

    @director.next_payment = Time.current

    if @director.save 
      redirect_to director_path(current_director), notice: "Director creado con exito"
    else
      redirect_to director_path(current_director), alert: "Error creando el director"
    end
  end
  
  def destroy
    @director = Director.find(params[:id])
    
    if @director.destroy
      redirect_to superusers_path, notice: "Director eliminado con exito"
    else
      redirect_to superusers_path, alert: "Error eliminando el director"
    end
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(director_params)
      redirect_to director_path(current_director), notice: "Director actualizado con exito"
    else
      redirect_to director_path(current_director), alert: "Error actualizando el director"
    end
  end

  protected

  def director_params
    params.require(:director).permit(:username, :email, :password, :password_confirmation)
  end
end