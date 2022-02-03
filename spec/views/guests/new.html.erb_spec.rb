require 'rails_helper'

RSpec.describe "guests/new", type: :view do
  before(:each) do
    assign(:guest, Guest.new(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString"
    ))
  end

  it "renders new guest form" do
    render

    assert_select "form[action=?][method=?]", guests_path, "post" do

      assert_select "input[name=?]", "guest[first_name]"

      assert_select "input[name=?]", "guest[last_name]"

      assert_select "input[name=?]", "guest[email]"
    end
  end
end
