class RenameResultDetailToExerciseDetail < ActiveRecord::Migration[5.2]
<<<<<<< HEAD
  def up
    rename_table :result_details, :exercise_details
  end

  def down
    rename_table :exercise_details, :result_deatils
  end
=======
  def change
    rename_table :result_details, :exercise_details
  end
>>>>>>> User can exercise
end
