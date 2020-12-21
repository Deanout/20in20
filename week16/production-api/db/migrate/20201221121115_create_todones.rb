class CreateTodones < ActiveRecord::Migration[6.0]
  def change
    create_table :todones do |t|

      t.timestamps
    end
  end
end
