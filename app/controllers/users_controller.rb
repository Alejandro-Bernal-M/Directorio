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

    @professions = Profession.all
    @jobs = Job.all
    @jobplaces = Jobplace.all
    @jobs_assigned = current_user.jobs
  end

  def update; end
end