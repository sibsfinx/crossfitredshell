require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new(
      :title => "MyString",
      :slug => "MyString",
      :content => "MyText",
      :active => false
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input#section_title[name=?]", "section[title]"

      assert_select "input#section_slug[name=?]", "section[slug]"

      assert_select "textarea#section_content[name=?]", "section[content]"

      assert_select "input#section_active[name=?]", "section[active]"
    end
  end
end
