require 'rails_helper'

RSpec.describe "kindles/new", :type => :view do
  before(:each) do
    assign(:kindle, Kindle.new(
      :user_id => 1,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new kindle form" do
    render

    assert_select "form[action=?][method=?]", kindles_path, "post" do

      assert_select "input#kindle_user_id[name=?]", "kindle[user_id]"

      assert_select "input#kindle_name[name=?]", "kindle[name]"

      assert_select "input#kindle_email[name=?]", "kindle[email]"
    end
  end
end
