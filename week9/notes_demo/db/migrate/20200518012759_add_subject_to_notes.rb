class AddSubjectToNotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :subject, null: false, foreign_key: true
  end
end
