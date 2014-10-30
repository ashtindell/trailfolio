require 'spec_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "POST create" do
    before do
      User.destroy_all
      @user = FactoryGirl.create(:user)
    end

    # let(:user) { FactoryGirl.create(:user) }
    # before { sign_in user, no_capybara: true }
    
    context "valid attributes" do
      it "signs in user" do
        post :create, session: { email: @user.email, password: @user.password }
        controller.should be_signed_in
      end

      it "redirects to users#show" do
        post :create, session: { email: @user.email, password: @user.password }
        expect(response).to redirect_to(user_path(@user.id))
      end
    end

    context "invalid attributes" do
      it "does not sign in user" do
        post :create, session: { email: @user.email, password: "wrong password" }
        controller.should_not be_signed_in
      end

      it "re-renders :new" do
        post :create, session: { email: @user.email, password: "wrong password" }
        expect(response).to render_template(:new)
      end
    end
  end
end
