require "rails_helper"

RSpec.describe Document, type: :model do
  # Test that a document is valid with a title and user
  it "is valid with a title and user" do
    user = User.create(email: "test@example.com", password: "password123")
    document = Document.new(title: "Test Document", user: user)
    expect(document).to be_valid
  end

  # Test that a document is invalid without a title
  it "is invalid without a title" do
    user = User.create(email: "test@example.com", password: "password123")
    document = Document.new(user: user)
    expect(document).not_to be_valid
  end
end