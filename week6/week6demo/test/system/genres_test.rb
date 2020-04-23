require "application_system_test_case"

class GenresTest < ApplicationSystemTestCase
  setup do
    @genre = genres(:one)
  end

  test "visiting the index" do
    visit genres_url
    assert_selector "h1", text: "Genres"
  end

  test "creating a Genre" do
    visit genres_url
    click_on "New Genre"

    fill_in "Name", with: @genre.name
    click_on "Create Genre"

    assert_text "Genre was successfully created"
    click_on "Back"
  end

  test "updating a Genre" do
    visit genres_url
    click_on "Edit", match: :first

    fill_in "Name", with: @genre.name
    click_on "Update Genre"

    assert_text "Genre was successfully updated"
    click_on "Back"
  end

  test "destroying a Genre" do
    visit genres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Genre was successfully destroyed"
  end
end
