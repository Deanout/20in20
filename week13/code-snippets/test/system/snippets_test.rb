require "application_system_test_case"

class SnippetsTest < ApplicationSystemTestCase
  setup do
    @snippet = snippets(:one)
  end

  test "visiting the index" do
    visit snippets_url
    assert_selector "h1", text: "Snippets"
  end

  test "creating a Snippet" do
    visit snippets_url
    click_on "New Snippet"

    fill_in "Body", with: @snippet.body
    fill_in "Title", with: @snippet.title
    click_on "Create Snippet"

    assert_text "Snippet was successfully created"
    click_on "Back"
  end

  test "updating a Snippet" do
    visit snippets_url
    click_on "Edit", match: :first

    fill_in "Body", with: @snippet.body
    fill_in "Title", with: @snippet.title
    click_on "Update Snippet"

    assert_text "Snippet was successfully updated"
    click_on "Back"
  end

  test "destroying a Snippet" do
    visit snippets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Snippet was successfully destroyed"
  end
end
