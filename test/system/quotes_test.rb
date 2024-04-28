require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test 'creating a Quote' do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on 'New Quote'
    assert_selector "h1", text: "New quote"

    fill_in 'Name', 'Capybara quote'
    click_on 'Create Quote'

    assert_text 'Quote was successfully created'
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test 'showing a Quote' do
    visit quotes_path
    click_on @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
