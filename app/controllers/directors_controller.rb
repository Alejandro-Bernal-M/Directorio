class DirectorsController < ApplicationController
  before_action :authenticate_director

  def show
    @director = Director.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render html: '<h1>Not found</h1>'.html_safe
  end
end