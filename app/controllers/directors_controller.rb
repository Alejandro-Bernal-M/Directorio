class DirectorsController < ApplicationController
  before_action :authenticate_director

  def show
    @users = User.all
    @director = Director.find(params[:id])
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
  # rescue ActiveRecord::RecordNotFound
  #   render html: '<h1>Not found</h1>'.html_safe
  end
end