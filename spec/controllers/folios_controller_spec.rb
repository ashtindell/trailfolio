require 'spec_helper'

describe FoliosController, :type => :controller do
  before do
    User.destroy_all
    sign_in user, no_capybara: true
  end

  let(:user) { FactoryGirl.create(:user) }

  describe "POST create folio" do
    context "valid attributes" do
      it "creates folio" do
        expect{
          post :create, folio: FactoryGirl.attributes_for(:folio)
        }.to change(Folio, :count).by(1)
      end

      it "redirects to :show" do
        post :create, folio: FactoryGirl.attributes_for(:folio)
        last_folio = Folio.last
        expect(response).to redirect_to(folio_path(last_folio.id))
      end
    end

    context "invalid attributes" do
      it "does not create folio" do
        expect{
          post :create, folio: FactoryGirl.attributes_for(:folio, title: " ")
        }.to_not change(Folio, :count)
      end

      it "re-renders :new" do
        post :create, folio: FactoryGirl.attributes_for(:folio, title: " ")
      end
    end
  end


  describe "GET show" do

    let(:folio) { FactoryGirl.create(:folio) }

    it "renders :show page" do
      get :show, id: folio.id
      expect(response).to render_template(:show)
    end

    it "assigns requested folio to @folio" do
      get :show, id: folio.id
      expect(assigns(:folio)).to eq(folio)
    end
  end

  describe "GET new" do

    let(:folio) { FactoryGirl.create(:folio) }

    it "assigns new folio to @folio" do
      get :new
      expect(assigns(:folio)).to be_a_new(Folio)
    end

    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET index" do
    before { Folio.destroy_all }

    let(:first_folio)  { FactoryGirl.create(:folio, title: "Favorites", user: user) }
    let(:second_folio) { FactoryGirl.create(:folio, title: "Next Trip", user: user) }

    it "renders :index" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all folios to @folios as an array" do
      get :index
      expect(assigns(:folios)).to eq([first_folio, second_folio])
    end
  end

  describe "GET edit folio" do
    let(:folio) { FactoryGirl.create(:folio) }
    it "renders :edit" do
      get :edit, id: folio.id
      expect(response).to render_template(:edit)
    end

    it "assigns requested folio to @folio" do
      get :edit, id: folio.id
      expect(assigns(:folio)).to eq(folio)
    end
  end

  describe "PUT update" do
    let(:folio) { FactoryGirl.create(:folio) }

    context "valid attributes" do
      it "changes @folio attributes" do
        put :update, id: folio.id, folio: FactoryGirl.attributes_for(:folio, title: "Do the dishes")
        folio.reload
        expect(folio.title).to eq("Do the dishes")
      end

      it "redirects to :show" do
        put :update, id: folio.id, folio: FactoryGirl.attributes_for(:folio, title: "Do the dishes")
        last_folio = Folio.last
        expect(response).to redirect_to(folio_path(last_folio.id))
      end
    end

    context "invalid attributes" do
      it "does not change @folio's attributes" do
        put :update, id: folio.id, folio: FactoryGirl.attributes_for(:folio, title: " ")
        folio.reload
        expect(folio.title).to eq("Favorites")
      end

      it "re-renders :edit" do
        put :update, id: folio.id, folio: FactoryGirl.attributes_for(:folio, title: " ")
        expect(response).to render_template(:edit)
      end
    end    
  end

  describe "DELETE destroy" do
    let!(:folio) { FactoryGirl.create(:folio) }

    it "deletes the folio" do
      expect{
        delete :destroy, id: folio.id
      }.to change(Folio, :count).by(-1)
    end

    it "redirects to :index" do
      delete :destroy, id: folio.id
      expect(response).to redirect_to(folios_path)
    end 
  end
end
