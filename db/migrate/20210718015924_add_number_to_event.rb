class AddNumberToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :number, :integer
  end
end
