class RenameStartAtColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :start_at, :started_at
  end
end
