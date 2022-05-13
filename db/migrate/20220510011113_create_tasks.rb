class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :color
      t.text :memo
      t.integer :start_time
      t.integer :task_time
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
