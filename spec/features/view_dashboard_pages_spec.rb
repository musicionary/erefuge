
require 'rails_helper'

describe "the admin dashboard process" do
  it "creates an admin" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :user)
    visit root_path
    click_on "Admin"

    expect(page).to have_content "Dashboard"
  end

  it "fails to return dashboard if not logged in" do
    visit rails_admin_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  it "fails to return dashboard if logged in but not admin" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit rails_admin_path
    expect(page).to have_content "You are not authorized to access this page."
  end
end
