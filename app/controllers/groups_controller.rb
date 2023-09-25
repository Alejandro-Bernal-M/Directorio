class GroupsController < ApplicationController
  before_action :check_logged 

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
end