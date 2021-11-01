require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :seat => "MyString",
      :name => "MyString",
      :price => "9.99",
      :venue => nil
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input[name=?]", "ticket[seat]"

      assert_select "input[name=?]", "ticket[name]"

      assert_select "input[name=?]", "ticket[price]"

      assert_select "input[name=?]", "ticket[venue_id]"
    end
  end
end
