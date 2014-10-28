require 'spec_helper'

# Can get passing after Hartl's sign in methods
# describe "folios_pages" do 

#   subject { page }

#   describe "show page GET /folios/:id" do
#     let(:folio) { FactoryGirl.create(:folio) }

#     before { visit folio_path(folio.id) }

#     it { should have_title("Show Folio | TrailFolio") }
#     it { should have_selector('h1', text: folio.title) }
#   end

#   describe "new page GET /folios/new" do
#     before { visit new_folio_path }

#     it { should have_title("New Folio | TrailFolio") }
#     it { should have_selector('h1', text: "Create New Folio") }

#     describe "create POST /folios" do
#       let(:submit) { "Save" }

#       context "valid information" do
#         before do
#           visit new_folio_path
#           fill_in "Title",        with: "Mountain Biking"
#         end

#         it "creates folio" do
#           expect { click_button submit }.to change(Folio, :count).by(1)
#         end

#         describe "after submission" do
#           before { click_button submit }

#           it { should have_title("Show Folio | TrailFolio") }
#           it { should have_selector('h1', text: "Mountain Biking") }
#         end
#       end 

#       context "invalid information" do
#         it "does not create folio" do
#           expect { click_button submit }.not_to change(Folio, :count)
#         end

#         describe "after submission" do
#           before { click_button submit }

#           it { should have_title('New Folio | TrailFolio') }
#           it { should have_content('error') }
#         end
#       end   
#     end    
#   end

#   describe "index page GET /folios" do
#     before { visit folios_path }
#     let(:folio) { FactoryGirl.create(:folio) }

#     it { should have_title('All Folios | TrailFolio') }
#     it { should have_selector('h1', text: 'All Folios') }

#     describe "destroy DELETE /folios/:id" do
#       it { should have_link('Delete', href: folio_path(Folio.first)) }

#       it "destroys the folio" do
#         expect {
#           click_link('Delete', match: :first)
#         }.to change(Folio, :count).by(-1)
#       end
#     end
#   end

#   describe "edit page GET /folios/:id/edit" do
#     let(:folio) { FactoryGirl.create(:folio) }

#     before { visit edit_folio_path(folio.id) }

#     it { should have_title("Edit Folio | TrailFolio") }
#     it { should have_selector('h1', text: "Edit #{@folio.title}") }

#     describe "update PUT /folio/:id" do
#       let(:submit) { "Save" }

#       context "valid information" do
#         before do
#           fill_in "Title", with: "Mountain Biking"
#           click_button submit
#         end

#         it { should have_title("Show Folio | TrailFolio") }
#         it { should have_selector('h1', text: "Mountain Biking") }
#         specify { expect(folio.reload.title).to eq("Mountain Biking") }
#       end

#       context "invalid information" do
#         before do
#           fill_in "Title", with: " "
#           click_button submit
#         end

#         it { should have_title('Edit Folio | TrailFolio') }
#         it { should have_content('error') }
#       end
#     end
#   end
# end