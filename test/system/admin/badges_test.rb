require "application_system_test_case"

class Admin::BadgesTest < ApplicationSystemTestCase
  setup do
    @admin_badge = admin_badges(:one)
  end

  test "visiting the index" do
    visit admin_badges_url
    assert_selector "h1", text: "Admin/Badges"
  end

  test "creating a Badge" do
    visit admin_badges_url
    click_on "New Admin/Badge"

    fill_in "Title", with: @admin_badge.title
    fill_in "Url", with: @admin_badge.url
    click_on "Create Badge"

    assert_text "Badge was successfully created"
    click_on "Back"
  end

  test "updating a Badge" do
    visit admin_badges_url
    click_on "Edit", match: :first

    fill_in "Title", with: @admin_badge.title
    fill_in "Url", with: @admin_badge.url
    click_on "Update Badge"

    assert_text "Badge was successfully updated"
    click_on "Back"
  end

  test "destroying a Badge" do
    visit admin_badges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Badge was successfully destroyed"
  end
end
