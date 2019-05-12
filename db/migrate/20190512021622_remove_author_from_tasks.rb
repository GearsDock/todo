class RemoveAuthorFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :datetime, :string
  end
end
