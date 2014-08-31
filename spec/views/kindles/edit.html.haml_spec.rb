require 'rails_helper'

RSpec.describe "kindles/edit", :type => :view do
  before(:each) do
    @kindle = assign(:kindle, Kindle.create!(
      :user_id => 1,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit kindle form" do
    render

    assert_select "form[action=?][method=?]", kindle_path(@kindle), "post" do

      assert_select "input#kindle_user_id[name=?]", "kindle[user_id]"

      assert_select "input#kindle_name[name=?]", "kindle[name]"

      assert_select "input#kindle_email[name=?]", "kindle[email]"
    end
  end
end
