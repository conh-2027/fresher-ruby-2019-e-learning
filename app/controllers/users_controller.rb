class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".success_created"
      redirect_to @user
    else
      flash[:fail] = t ".fail_create"
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]
    
    return if @user
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
