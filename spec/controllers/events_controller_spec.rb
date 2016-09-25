require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do
    it "populates instance variables" do
      user = FactoryGirl.create(:user)
      event = FactoryGirl.create(:event, user_id: user.id)
      sign_in(user)
      get :index
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new event" do
        user = FactoryGirl.create(:user)
        sign_in(user)
        expect {
          post :create, params: { event: FactoryGirl.attributes_for(:event) }
        }.to change(Event,:count).by(1)
      end
    end
  end

  describe "POST #edit" do
    context "with valid attributes" do
      it "edits a new event" do
        user = FactoryGirl.create(:user)
        sign_in(user)
        event = FactoryGirl.create(:event, user_id: user.id)
        put :update, event.name => "Tester"
        event.reload
        expect(event.name).to eq "Tester"
      end
    end
  end
end
