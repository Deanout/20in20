class AddLanguagesToSnippets < ActiveRecord::Migration[6.0]
  def change
    add_reference :snippets, :language, null: false, foreign_key: true
  end
end
