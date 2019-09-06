class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    course = Course.find_by id: params[:course_id]
    
    if course.present?
      @supports = Supports::Word.new course, params[:page]
      
      return if @supports.load_words.empty?
      LearningService.new(current_user, @supports.load_words.first).mark_learned
    else
      flash[:danger] = t ".not_found"
      redirect_to root_path
    end
  end
  
  def view_word
    @learnings = current_user.learnings.includes(:word).page(params[:page]).per Settings.words.learning.paging_number
  end
end
