require 'spec_helper'

describe "users" do

  subject { page }

  describe "signup GET /signup" do
    before { visit signup_path }

    it { should have_title("Sign Up | TrailFolio") }
    it { should have_selector('h1', text: "Sign Up") }

    describe "signup POST /users" do
      let(:submit) { "Create an account" }

      context "valid information" do
        before do
          User.destroy_all
          fill_in "Name",                   with: "Ashley Tindell"
          fill_in "Email",                  with: "tindell.ea@gmail.com"
          fill_in "Password",               with: "foobar"
          fill_in "Confirmation",  with: "foobar"
        end

        it "creates user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title("Ashley Tindell | TrailFolio") }
          it { should have_selector('h1', text: "Ashley Tindell") }
        end
      end

      context "invalid information" do
        it "does not create user" do
          expect { click_button submit }.not_to change(User, :count)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title("Sign Up | TrailFolio") }
          it { should have_content('error') }
        end
      end
    end
  end

  # describe "show page GET /users/:id" do
  #   before do
  #     User.destroy_all
  #     @user = FactoryGirl.create(:user)
  #     visit user_path(@user.id)
  #   end

  #   it { should have_title(@user.name) }
  #   it { should have_content(@user.name) }
  # end
end