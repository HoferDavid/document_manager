require 'rails_helper'

RSpec.describe "documents/edit", type: :view do
  let(:document) {
    Document.create!(
      title: "MyString",
      description: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:document, document)
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(document), "post" do

      assert_select "input[name=?]", "document[title]"

      assert_select "textarea[name=?]", "document[description]"

      assert_select "input[name=?]", "document[user_id]"
    end
  end
end
