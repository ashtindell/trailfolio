require 'spec_helper'

describe TrailsController, :type => :controller do
  before do
    User.destroy_all
  end

  let(:user) { FactoryGirl.create(:user) }

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

  describe "POST create / save a trail to folio" do
    before do
      Folio.destroy_all
    end

    let(:folio) { FactoryGirl.create(:folio, user: user) }   
    context "with valid attributes" do
      it "saves the new trail" do
        expect {
          post :create, trail: FactoryGirl.attributes_for(:trail).merge({ folio_id: folio.id })
        }.to change(Trail, :count).by(1)
      end

      it "redirects to relevant folio#show page" do
        post :create, trail: FactoryGirl.attributes_for(:trail).merge({ folio_id: folio.id })
        expect(response).to redirect_to(folio_path(folio.id))
      end
    end
  end
end
