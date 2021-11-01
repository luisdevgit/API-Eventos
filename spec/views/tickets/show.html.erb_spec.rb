require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :seat => "Seat",
      :name => "Name",
      :price => "9.99",
      :venue => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Seat/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
