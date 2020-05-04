class AddFeaturedToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :feature_in_navbar, :boolean, default: false
  end
end
