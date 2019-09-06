class RenameResultIdToExerciseId < ActiveRecord::Migration[5.2]
  def up
    rename_column :exercise_details, :result_id, :exercise_id
  end

  def down
    rename_column :exercise_details, :exercise_id, :result_id
  end
end
