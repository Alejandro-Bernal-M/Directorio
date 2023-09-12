class SessionsController < ApplicationController
  def new
  end

  def create
    director = Director.find_by(email: params[:email])
    if director && director.authenticate(params[:password])
      # Log in the director and redirect to their profile or a desired page
      session[:director_id] = director.id
      redirect_to director_path(director)
    else
      flash.now[:danger] = 'Correo o contraseña incorrectos'
      render 'new'
    end
  end

  def destroy
    session.delete(:director_id)
    redirect_to root_url
  end
end
