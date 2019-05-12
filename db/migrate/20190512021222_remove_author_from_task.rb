class RemoveAuthorFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :Yotei, :string
  end
end
