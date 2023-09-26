class GroupsController < ApplicationController
  before_action :check_logged, only: [:show]

  def check_logged
    unless current_director || current_user
      flash[:notice] = 'Inicia sesión primero'
      return redirect_to root_path
    end

    @group = Group.find(params[:id])
    @director = @group.director
    @users = @group.users

    unless current_director == @director || @users.include?(current_user)
      flash[:notice] = 'No perteneces al grupo'
      redirect_to root_path
    end
  end

  def index; end

  def show
    @group = Group.includes(:users).find(params[:id])
    @professions = Profession.all
    @jobplaces = Jobplace.all
    @jobs = Job.all
    @director = @group.director
    @responsibilities = Responsibility.all
    @jobsusers = JobsUser.all
    @users = @group.users
    @users_processed = @users.map {|user| {user: user, jobs: user.jobs.map{|job| {job: job, responsibilities: @responsibilities.where(jobs_user_id: @jobsusers.where(job_id: job.id, user_id: user.id))}}, professions: user.professions,  jobplaces: user.jobplaces }}
  end

  def new
    @group = Group.new
  end
  
  
  def create
    @group = Group.new(group_params)
    
    respond_to do |format|
      if @group.save
        format.html{redirect_to director_path(current_director), notice: 'Grupo creado'}
      else
        format.html{ render :new, status: :unprocessable_entity}
      end
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update(group_params)
        format.html{redirect_to director_path(current_director), notice: 'Grupo actualizado'}
      else
        format.html{ render :edit, status: :unprocessable_entity}
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :slogan, :color, :director_id)
  end
end