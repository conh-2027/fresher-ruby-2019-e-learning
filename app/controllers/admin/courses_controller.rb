class Admin::CoursesController < Admin::BaseController
  before_action :load_course, except: %i(index new create)

  def index
    @courses = Course.order(created_at: :desc).page(params[:page])
      .per Settings.courses.paging.page_number
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build course_params
    
    if @course.save
      flash[:success] = t ".success_created"
      redirect_to admin_courses_path
    else
      flash[:danger] = t ".fail_create"
      render :new
    end
  end

  def update
    if @course.update course_params
      flash[:success] = t ".success_updated"
      redirect_to admin_courses_path
    else
      flash[:danger] = t ".fail_update"
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = t ".success_destroy"
    else
      flash[:danger] = t ".fail_destroy"
    end
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit Course::COURSE_PARAMS
  end

  def load_course
    @course = Course.find_by id: params[:id]

    return if @course
    flash[:danger] = t ".not_found"
    redirect_to admin_courses_path
  end
end
