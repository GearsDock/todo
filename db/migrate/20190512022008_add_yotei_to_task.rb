class AddYoteiToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :yotei, :datetime
  end
end
