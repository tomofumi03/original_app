class AddLessonTimeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :lesson_time, :integer
  end
end
