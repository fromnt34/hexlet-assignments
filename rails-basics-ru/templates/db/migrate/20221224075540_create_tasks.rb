class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :status
      t.string :creator
      t.string :performer
      t.boolean :completed

      t.timestamps
    end
  end
end
