class RemoveAuthorFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :kaishi, :datetime
    remove_column :tasks, :yotei, :datetime
    remove_column :tasks, :shuuryou, :datetime
    remove_column :tasks, :yuusen, :string
    remove_column :tasks, :status, :string
    
    
  end
end
