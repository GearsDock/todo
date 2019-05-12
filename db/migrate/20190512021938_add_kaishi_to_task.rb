class AddKaishiToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :kaishi, :datetime
  end
end
