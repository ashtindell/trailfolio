# require 'spec_helper'

# describe TrailsController, :type => :controller do
#   before do
#     User.destroy_all
#   end

#   let(:user) { FactoryGirl.create(:user) }
#   before { sign_in user, no_capybara: true }

#   describe "POST create trail" do
#     context "valid attributes" do
#       it "creates trail" do
#         expect{
#           post :create, trail: FactoryGirl.attributes_for(:trail)
#         }.to change(Trail, :count).by(1)
#       end

#       it "redirects to :show" do
#         post :create, trail: FactoryGirl.attributes_for(:trail)
#         last_trail = Trail.last
#         expect(response).to redirect_to(trail_path(last_trail.id))
#       end
#     end

#     context "invalid attributes" do
#       it "does not create trail" do
#         expect{
#           post :create, trail: FactoryGirl.attributes_for(:trail, name: " ")
#         }.to_not change(Trail, :count)
#       end

#       it "re-renders :new" do
#         post :create, trail: FactoryGirl.attributes_for(:trail, name: " ")
#       end
#     end
#   end
# end
