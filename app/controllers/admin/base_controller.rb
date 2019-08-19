class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :check_admin
  layout "admin"

  def index; end

  private

  def check_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
