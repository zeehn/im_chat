class AddColumnToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :created_at, :datatime
    add_column :messages, :updated_at, :datatime
  end
end
