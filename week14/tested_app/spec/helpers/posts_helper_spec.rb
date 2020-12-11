require 'rails_helper'
include PostsHelper
RSpec.describe PostsHelper, type: :helper do
  it 'assigns a user to a post' do
    # Arranging our data => Assigning variables
    creator = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
    @post = Post.new(title: 'MyString', body: 'MyText', views: 1)

    # Act => We're acting with our arranged variables
    returned_post = assign_post_creator(@post, creator)

    # Assert => Assert that our expected outcome matches our actual outcome.
    expect(returned_post.user).to be(creator)
  end
end
