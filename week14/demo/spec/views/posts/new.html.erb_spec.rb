require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  before(:each) do
    assign(:post, Post.new(
                    title: 'MyString',
                    body: 'MyText',
                    user: nil,
                    views: 0
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
