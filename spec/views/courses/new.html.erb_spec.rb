require 'rails_helper'

RSpec.describe 'courses/new', type: :view do
  before(:each) do
    assign(:course, Course.new(
                      name: 'MyString',
                      group_id: 1
    ))
  end

  it 'renders new course form' do
    render

    assert_select 'form[action=?][method=?]', courses_path, 'post' do
      assert_select 'input[name=?]', 'course[name]'

      assert_select 'input[name=?]', 'course[group_id]'
    end
  end
end
