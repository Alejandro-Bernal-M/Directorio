class SuperusersController < ApplicationController
  before_action :check_super


  def index; end

  private

  def check_super
    unless @super_user
      redirect_to root_path, alert: 'Sin acceso'
    end
  end

end