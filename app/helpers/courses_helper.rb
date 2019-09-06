module CoursesHelper
  def load_image course
    image = course.image.attached? ? course.image : Settings.courses.image
  end

  def get_list_courses
    Course.pluck :name, :id
  end
end
