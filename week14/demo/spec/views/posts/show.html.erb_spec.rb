require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  before(:each) do
    current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
    @post = assign(:post, Post.create!(
                            title: 'Title',
                            body: 'MyText',
                            user: current_user,
                            views: 0
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/0/)
  end
end
