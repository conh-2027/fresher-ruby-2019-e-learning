class Admin::UsersController < Admin::BaseController
  before_action :load_user, except: %i(index new create)

  def index
    @users = User.order(created_at: :desc).page(params[:page])
      .per Settings.users.paging.paging_number
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".success_created"
      redirect_to admin_users_path
    else
      flash[:dange] = t ".fail_create"
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t ".success_updated"
      redirect_to admin_users_path
    else
      flash[:danger] = t ".fail_update"
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".success_destroyed"
    else
      flash[:fail] = t ".fail_destroy"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit User::ADMIN_USER_PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".not_found"
    redirect_to admin_users_path
  end
end
