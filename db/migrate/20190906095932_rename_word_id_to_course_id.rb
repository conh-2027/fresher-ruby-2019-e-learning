class RenameWordIdToCourseId < ActiveRecord::Migration[5.2]
  def up
    rename_column :questions, :word_id, :course_id
  end

  def down 
    rename_column :questions, :course_id, :word_id
  end
end
