require 'rails_helper'

RSpec.describe "guests/edit", type: :view do
  before(:each) do
    @guest = assign(:guest, Guest.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit guest form" do
    render

    assert_select "form[action=?][method=?]", guest_path(@guest), "post" do

      assert_select "input[name=?]", "guest[first_name]"

      assert_select "input[name=?]", "guest[last_name]"

      assert_select "input[name=?]", "guest[email]"
    end
  end
end
