class UsersController < ApplicationController
  def index; end

  def show
    @requests_unprocessed = Request.where(user_id: current_user.id)
    @group_ids = @requests_unprocessed.pluck(:group_id)
    @groups = Group.where(id: @group_ids).to_a
    @groups_assigned = current_user.groups
  
    @requests = @requests_unprocessed.map do |request|
      {
        request: request,
        group: @groups.find { |group| group.id == request.group_id }
      }
    end

    @professions = Profession.all.order(:name)
    @professions_assigned = current_user.professions.map{|profession| {name: profession.name, association_id: ProfessionsUser.where(profession_id: profession.id, user_id: current_user.id)[0].id}}
    @jobs = Job.all.order(:name)
    @jobplaces = Jobplace.all
    @jobs_assigned = current_user.jobs.map{|job| {name: job.name, association_id: JobsUser.where(job_id: job.id, user_id: current_user.id)[0].id, responsibilities: JobsUser.where(job_id: job.id, user_id: current_user.id)[0].responsibilities, id:job.id }}
    puts @jobs_assigned
  end

  def update; end
end