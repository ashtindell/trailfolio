require 'spec_helper'

describe "static_pages" do

  subject { page }

  describe "home page" do
    before { visit home_path }
    it { should have_selector('h1', text: "Welcome") }
    it { should have_title("Home | TrailFolio") }
  end

  describe "about" do
    before { visit about_path }
    it { should have_selector('h1', text: "About") }
    it { should have_title("About | TrailFolio") }
  end

  describe "help" do
    before { visit help_path }
    it { should have_selector('h1', text: "Help") }
    it { should have_title("Help | TrailFolio") }
  end
end