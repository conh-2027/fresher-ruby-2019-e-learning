class RenameResultToExercise < ActiveRecord::Migration[5.2]
  def up
    rename_table :results, :exercises
  end

  def down
    rename_table :exercises, :results
  end
end
