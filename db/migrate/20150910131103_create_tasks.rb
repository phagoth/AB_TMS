class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.datetime :due_date
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
