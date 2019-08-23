class UsersController < ApplicationController
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

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end
end
