require 'rails_helper'

describe "the edit user path" do
  it "edits a user" do
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
    # click_on "View Account"
    click_on "Edit User Info"
    fill_in "Email", :with => "test2@test.com"
    fill_in "user_current_password", :with => "123456"
    click_button "Update"
    expect(page).to have_content "Your account has been updated successfully."
  end

  it "fails to edit user if current password is incorrect" do
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
    # click_on "View Account"
    click_on "Edit User Info"
    fill_in "Email", :with => "test2@test.com"
    fill_in "user_current_password", :with => "1through"
    click_button "Update"
    expect(page).to have_content "we need your current password to confirm your changesis invalid"
  end
end
