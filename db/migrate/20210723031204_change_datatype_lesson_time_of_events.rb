class ChangeDatatypeLessonTimeOfEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :lesson_time, 'integer USING CAST(column_name AS integer)'
  end
end
