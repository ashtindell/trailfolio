require 'spec_helper'

describe UsersController, type: :controller do
  before do
    User.destroy_all
  end

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user, no_capybara: true }
  
  describe "POST create user" do
    context "valid attributes" do
      it "creates user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it  "redirects to :show" do
        post :create, user: FactoryGirl.attributes_for(:user)
        last_user = User.last
        expect(response).to redirect_to(user_path(last_user.id))
      end
    end

    context "invalid attributes" do
      it "does not create user" do
        expect{
        post :create, user: FactoryGirl.attributes_for(:user, email: " ")
        }.to_not change(User, :count)
      end
      it "re-renders :new" do
        post :create, user: FactoryGirl.attributes_for(:user, email: " ")
        expect(response).to render_template(:new)
      end
    end
  end

end