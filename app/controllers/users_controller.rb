class UsersController < ApplicationController
  before_action :set_user unless :current_director
  def index; end

  def show
    @user = User.find(params[:id])
    @requests_unprocessed = Request.where(user_id: params[:id])
    @group_ids = @requests_unprocessed.pluck(:group_id)
    @groups = Group.where(id: @group_ids).to_a
    @groups_assigned = @user.groups
  
    @requests = @requests_unprocessed.map do |request|
      {
        request: request,
        group: @groups.find { |group| group.id == request.group_id }
      }
    end

    @professions = Profession.all.order(:name)
    @professions_assigned = @user.professions.map{|profession| {name: profession.name, association_id: ProfessionsUser.where(profession_id: profession.id, user_id: @user.id)[0].id}}
    @jobs = Job.all.order(:name)
    @jobplaces = Jobplace.all.order(:name)
    @jobplaces_assigned = @user.jobplaces.map{|jobplace| {name: jobplace.name, city: jobplace.city, association_id: JobplacesUser.where(jobplace_id: jobplace.id, user_id: @user.id)[0].id}}
    @jobs_assigned = @user.jobs.map{|job| {name: job.name, association_id: JobsUser.where(job_id: job.id, user_id: @user.id)[0].id, responsibilities: JobsUser.where(job_id: job.id, user_id: @user.id)[0].responsibilities, id:job.id }}
    print @jobs_assigned
  end

  def update; end
end