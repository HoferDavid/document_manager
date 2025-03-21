require "rails_helper"

RSpec.describe DocumentsController, type: :controller do
  # Test the index action
  describe "GET #index" do
    # Test for authenticated users
    context "with authenticated user" do
      let(:user) { User.create(email: "test@example.com", password: "password123") }

      before do
        sign_in user # Simulate user login
      end

      it "returns a success response" do
        get :index
        expect(response).to be_successful # Should return HTTP 200
      end
    end

    # Test for unauthenticated users
    context "without authenticated user" do
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path) # Should redirect to login
      end
    end
  end
end
