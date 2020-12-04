class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name

      t.timestamps
    end
    add_index :languages, :name
  end
end
