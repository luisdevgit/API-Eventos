require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :seat => "MyString",
      :name => "MyString",
      :price => "9.99",
      :venue => nil
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[seat]"

      assert_select "input[name=?]", "ticket[name]"

      assert_select "input[name=?]", "ticket[price]"

      assert_select "input[name=?]", "ticket[venue_id]"
    end
  end
end
