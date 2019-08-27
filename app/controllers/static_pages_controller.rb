class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def home
    @supports = Supports::Home.new current_user, params[:page]
  end
end
