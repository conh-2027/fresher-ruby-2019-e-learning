class RemoveCorrectAnswerFromQuestions < ActiveRecord::Migration[5.2]
  def up
    remove_column :questions, :correct_answer, :string
  end
  def down
    add_column :questions, :correct_answer, :string
  end
end
