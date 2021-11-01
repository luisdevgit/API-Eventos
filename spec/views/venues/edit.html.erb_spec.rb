require 'rails_helper'

RSpec.describe "venues/edit", type: :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "MyString",
      :location => "MyString",
      :event => nil
    ))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do

      assert_select "input[name=?]", "venue[name]"

      assert_select "input[name=?]", "venue[location]"

      assert_select "input[name=?]", "venue[event_id]"
    end
  end
end
