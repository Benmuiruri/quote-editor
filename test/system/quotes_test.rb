require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end
  test 'Creating a new quote ' do
    # When we visit the Quotes#index page, we should see a list of quotes
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    # WHen we click on the link with the text "NEw Quote", we should be taken to a page with the title "New Quote"
    click_on 'New Quote'
    fill_in 'Name', with: 'Capybara quote'
    
    assert_selector 'h1', text: 'Quotes'
    click_on 'Create quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Capybara quote'
  end

  test "Showing a quote" do
    visit quotes_path
    click_on @quote.name

    assert_selector 'h1', text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    assert_selector "h1", text: "Quotes"
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
