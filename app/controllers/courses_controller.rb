class CoursesController < ApplicationController
  before_action :logged_in_user

  def index
    @courses = Course.sort_by_created_at.page(params[:page])
      .per Settings.courses.paging.page_number
  end
end
