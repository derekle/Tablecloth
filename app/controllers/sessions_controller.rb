class SessionsController < ApplicationController
  #A filter is a method which runs before, after, or around, a controller's action. 
  #In this case, the filter runs before all SessionController's actions,
  #and kicks requests out with 403 Forbidden unless they're logged in.
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  def new
  end

  def create
    session[:username] = params[:username]
    render :index
  end

  #logging out by destroying session
  def destroy
    session.delete :user_id
    redirect_to :controller => 'users', :action => 'index'
  end 
end
