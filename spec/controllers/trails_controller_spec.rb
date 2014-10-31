require 'spec_helper'

describe TrailsController, :type => :controller do
  before do
    User.destroy_all
    Folio.destroy_all
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:folio) { FactoryGirl.create(:folio) }

  before { sign_in user, no_capybara: true }

  describe "GET show" do

    let(:trail) { FactoryGirl.create(:trail) }

    it "renders :show page" do
      get :show, id: trail.id
      expect(response).to render_template(:show)
    end

    it "assigns requested trail to @trail" do
      get :show, id: trail.id
      expect(assigns(:trail)).to eq(trail)
    end
  end
end
