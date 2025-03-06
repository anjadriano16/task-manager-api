class AddAssignedToToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :assigned_to, :integer
  end
end
