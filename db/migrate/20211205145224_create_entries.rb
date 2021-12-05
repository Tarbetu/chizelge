class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :comment
      t.text :type
      t.datetime :finished_at

      t.timestamps
    end
  end
end
