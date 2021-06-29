class RemoveStatusFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :status, :integer
  end
end
