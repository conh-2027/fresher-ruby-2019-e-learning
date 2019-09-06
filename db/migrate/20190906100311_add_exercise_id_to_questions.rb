class AddExerciseIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :exercise_id, :integer
  end
end
