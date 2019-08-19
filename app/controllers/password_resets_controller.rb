class PasswordResetsController < ApplicationController
  before_action :load_user, :valid_user, :check_expiration, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t ".your_check_mail"
      redirect_to root_path
    else
      flash[:danger] = t ".email_not_exist"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add :passsword, t(".password_empty")
      render :edit
    elsif @user.update user_params
      login @user
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def load_user
    @user = User.find_by email: params[:email]
    
    return if @user
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def valid_user
    return if @user && @user.activated? && @user.authenticated?(:reset, params[:id])
    flash[:danger] = t ".email_valid"
    render :new
  end

  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = t ".expried_reset_password"
    redirect_to new_reset_password_url
  end
end
