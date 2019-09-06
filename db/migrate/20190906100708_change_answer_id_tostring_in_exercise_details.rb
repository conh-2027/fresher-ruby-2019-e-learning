class ChangeAnswerIdTostringInExerciseDetails < ActiveRecord::Migration[5.2]
  def up
    change_column :exercise_details, :answer_id, :string
  end

  def down
    change_column :exercise_details, :answer_id, :integer
  end
end
