class ChangeTypeColumnToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :entries, :type, :category
  end
end
