module CoursesHelper
  def load_image course
    image = course.image.attached? ? course.image : Settings.courses.image
  end
end
