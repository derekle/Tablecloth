class SessionsController < ApplicationController
  #fixed a invalidauthenticity token error. solution found at https://www.appsignal.com/for/invalid_authenticity_token
  skip_before_action :verify_authenticity_token

  #A filter is a method which runs before, after, or around, a controller's action. 
  #In this case, the filter runs before all SessionController's actions,
  #and kicks requests out with 403 Forbidden unless they're logged in.
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  def new
    if logged_in?
      redirect_to home_path
    end
  end

  def create
    if from_omniauth?
      auth_hash = from_omniauth?
      user = User.from_omniauth(auth_hash)

      user.save
      
      session[:user_id] = user.id
      flash[:notice] = ["Login Successful"]
      redirect_to home_path
    else
      @user = User.find_by(username: params[:username], email: params[:email])
      if @user != nil
        session[:user_id] = User.find_by(username: params[:username], email: params[:email]).id
        flash[:notice] = ["Login Successful"]
        redirect_to home_path
      else
        flash[:error] = ["Login Failed"]
        render :new
      end
    end
  end

  def show
  end

  #logging out by destroying session
  def destroy
    session.delete :user_id
    redirect_to home_path
  end 

  private

  def from_omniauth?
    request.env['omniauth.auth']
  end
end
