module ExercisesHelper
  def convert_date date
    date.strftime(Settings.exercises.created_at_exercise)
  end
end
