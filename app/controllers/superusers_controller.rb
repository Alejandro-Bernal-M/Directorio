class SuperusersController < ApplicationController
  before_action :check_super


  def index
    @directors = Director.all.includes(:groups).order(:created_at)
  end

  private

  def check_super
    unless @super_user
      redirect_to root_path, alert: 'Sin acceso'
    end
  end

end