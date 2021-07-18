class AddLessonTimeToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :lesson_time, :time
  end
end
