require 'rails_helper'

RSpec.describe "books/new", :type => :view do
  before(:each) do
    assign(:book, Book.new(
      :user_id => 1,
      :title => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_user_id[name=?]", "book[user_id]"

      assert_select "input#book_title[name=?]", "book[title]"
    end
  end
end
