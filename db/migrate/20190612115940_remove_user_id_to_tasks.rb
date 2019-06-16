class RemoveUserIdToTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :user_id, :integer
    remove_column :tasks, :user_id_id, :bigint
  end
end
