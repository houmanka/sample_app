require 'spec_helper'

describe "UserPages" do
  
  subject { page }

  describe "signup page" do 
  	before { visit signup_path }

    let(:submit) {"Create my account"}
  	# it { should have_selector('h1', text: 'Sign up') }
  	# it { should have_selector('title', text: full_title('Sign up')) }
    describe "with invalid information" do
      it "should not create a user" do
        expect {click_button submit}.not_to change{User, :count}
      end
    end
  
    describe "with valid information" do

      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar" 
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving a user" do

        before {click_button submit}


        let(:user) { User.find_by_email("user@example.com") }
        
        it {should have_selector('title', text: user.name) }
      end
    end
  end
end
