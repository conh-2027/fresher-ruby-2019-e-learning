class AddTimeStartToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :time_start, :datetime
  end
end
