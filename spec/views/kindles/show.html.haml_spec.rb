require 'rails_helper'

RSpec.describe "kindles/show", :type => :view do
  before(:each) do
    @kindle = assign(:kindle, Kindle.create!(
      :user_id => 1,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
