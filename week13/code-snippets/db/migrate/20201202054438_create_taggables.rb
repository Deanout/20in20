class CreateTaggables < ActiveRecord::Migration[6.0]
  def change
    create_table :taggables do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :snippet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
