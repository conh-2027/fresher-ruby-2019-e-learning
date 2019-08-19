class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    
    if user&.authenticate(params[:session][:password])
      login user
      redirect_to current_user
    else
      flash[:danger] = t ".login_fail"
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
