class AddShuuryouToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :shuuryou, :datetime
  end
end
