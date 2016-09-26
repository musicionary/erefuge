require 'rails_helper'

describe "the destroy an account process" do
  it "destroys an account" do
    visit root_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_account_path
    account = FactoryGirl.build(:account)
    fill_in "First name", :with => account.first_name
    fill_in "Last name", :with => account.last_name
    click_button "Create Account"
    account.user_id = user.id
    account.save
    visit account_path(account)
    click_on "Delete"
    expect(page).to have_content "We're sad to see you go. Join us again soon!"
  end
end
