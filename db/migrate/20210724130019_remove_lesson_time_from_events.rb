class RemoveLessonTimeFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :lesson_time, :integer
  end
end
