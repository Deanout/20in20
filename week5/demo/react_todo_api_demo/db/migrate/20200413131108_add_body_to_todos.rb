class AddBodyToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :body, :text
  end
end
