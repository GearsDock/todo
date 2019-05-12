class AddYuusenToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :yuusen, :string
  end
end
