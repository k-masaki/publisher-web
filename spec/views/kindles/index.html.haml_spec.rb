require 'rails_helper'

RSpec.describe "kindles/index", :type => :view do
  before(:each) do
    assign(:kindles, [
      Kindle.create!(
        :user_id => 1,
        :name => "Name",
        :email => "Email"
      ),
      Kindle.create!(
        :user_id => 1,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of kindles" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
