require 'rails_helper'

describe "the new account path" do
  it "creates a new account" do
    visit root_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_account_path
    account = FactoryGirl.build(:account)
    fill_in "First name", :with => account.first_name
    fill_in "Last name", :with => account.last_name
    click_button "Create Account"
    account.user_id = user.id
    expect(page).to have_content "Thanks for creating an account."
  end

  it "fails to create new account if fields are blank" do
    visit root_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_account_path
    click_button "Create Account"
    expect(page).to have_content "can't be blank"
  end
end
