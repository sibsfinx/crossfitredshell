require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :title => "MyString",
      :slug => "MyString",
      :content => "MyText",
      :active => false
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input#section_title[name=?]", "section[title]"

      assert_select "input#section_slug[name=?]", "section[slug]"

      assert_select "textarea#section_content[name=?]", "section[content]"

      assert_select "input#section_active[name=?]", "section[active]"
    end
  end
end
