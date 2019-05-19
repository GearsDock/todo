class AddStatusToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :planned_finished_at, :date
    add_column :tasks, :finished_at, :date
    add_column :tasks, :priority, :integer, default: 1, null: false, limit: 1
    add_column :tasks, :status, :integer, default: 1, null: false, limit: 1
  end
end
