require 'rails_helper'

describe "the edit an account path" do
  it "edits an account" do
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
    visit edit_account_path(account)
    fill_in "First name", :with => "John"
    fill_in "Last name", :with => account.last_name
    click_button "Update Account"
    expect(page).to have_content "Account successfully updated!"
  end

  it "fails to edit an account if fields are blank" do
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
    login_as(user, :scope => :user)
    visit edit_account_path(account)
    fill_in "First name", :with => ""
    fill_in "Last name", :with => ""
    click_button "Update Account"
    expect(page).to have_content "can't be blank"
  end
end
