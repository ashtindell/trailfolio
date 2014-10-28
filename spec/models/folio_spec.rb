require 'spec_helper'

RSpec.describe Folio, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  before { @folio = user.folios.create(title: "Favorites") }

  subject { @folio }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should be_valid }

  describe "validations" do
    describe "when user_id is not present" do
      before { @folio.user_id = nil }
      it { should_not be_valid }
    end

    describe "title" do
      context "not present" do
        before { @folio.title = " " }
        it { should_not be_valid }
      end

      context "too short" do
        before { @folio.title = "a" * 2 }
        it { should_not be_valid }
      end

      context "too long" do
        before { @folio.title = "a" * 51 }
        it { should_not be_valid }
      end
    end
  end
end
