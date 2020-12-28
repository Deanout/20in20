class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
