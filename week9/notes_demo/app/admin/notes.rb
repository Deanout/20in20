# frozen_string_literal: true

ActiveAdmin.register Note do
  permit_params :title, :body, :subject_id

  form title: 'Notes App' do |f|
    f.inputs 'Note' do
      f.input :subject
      f.input :title
      f.input :body, as: :quill_editor
    end
    f.actions
  end

  show title: 'Your Note' do
    h1 link_to note.title, admin_notes_path
    h4 link_to note.subject.name, admin_subject_path(note.subject)
    div(class: 'note-body') do
      raw note.body
    end
  end

  index do
    selectable_column
    column :subject
    column 'Title' do |note|
      link_to note.title, admin_note_path(note)
    end
    column 'Body' do |note|
      raw note.body.truncate_words(25)
    end
    column :created_at
    column :updated_at
  end
end
