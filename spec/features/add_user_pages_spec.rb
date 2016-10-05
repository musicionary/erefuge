require 'rails_helper'

describe "the new user signup path" do
  it "creates a new user" do
    visit root_path
    click_on "nav-signup"
    fill_in "Email", :with => "test1@test.com"
    fill_in "User name", :with => "Steven"
    fill_in "user_password", :with => "654321"
    fill_in "user_password_confirmation", :with => "654321"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "fails to create new user if fields are blank" do
    visit root_path
    click_on "nav-signup"
    click_button "Sign up"
    expect(page).to have_content "Please review the problems below:"
  end
end
