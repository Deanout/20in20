class AddNameToTodones < ActiveRecord::Migration[6.0]
  def change
    add_column :todones, :name, :string
  end
end
