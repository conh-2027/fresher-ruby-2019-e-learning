class RenameResultDetailToExerciseDetail < ActiveRecord::Migration[5.2]
  def up
    rename_table :result_details, :exercise_details
  end

  def down
    rename_table :exercise_details, :result_deatils
  end
end
