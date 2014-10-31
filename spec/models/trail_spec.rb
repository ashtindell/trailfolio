require 'rails_helper'

RSpec.describe Trail, :type => :model do
  let(:folio) { FactoryGirl.create(:folio) }

  before { @trail = folio.trails.create(name: "Sweetwater Creek") }

  subject { @trail }

  it { should respond_to(:name) }
  it { should respond_to(:folio_id) }
  it { should respond_to(:folio) }
  it { should be_valid }

end
