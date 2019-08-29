module WordsHelper
  def load_courses
    Course.pluck :name, :id
  end
end
