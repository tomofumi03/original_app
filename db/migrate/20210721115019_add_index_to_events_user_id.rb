class AddIndexToEventsUserId < ActiveRecord::Migration[5.1]
  def change
    add_index :events, :user_id
  end
end
