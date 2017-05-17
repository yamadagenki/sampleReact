require 'rails_helper'

RSpec.describe 'courses/edit', type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
                                name: 'MyString',
                                group_id: 1
    ))
  end

  it 'renders the edit course form' do
    render

    assert_select 'form[action=?][method=?]', course_path(@course), 'post' do
      assert_select 'input[name=?]', 'course[name]'

      assert_select 'input[name=?]', 'course[group_id]'
    end
  end
end
