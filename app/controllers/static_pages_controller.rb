class StaticPagesController < ApplicationController
  def home
    @courses = Course.sort_by_created_at 
  end
end
