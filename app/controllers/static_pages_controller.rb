class StaticPagesController < ApplicationController
  def home
    @courses = Course.all.limit 3
  end
end
