require 'rails_helper'
include PostsHelper
# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  creator = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  @post = Post.new(
    title: 'MyString',
    body: 'MyText',
    views: 1
  )
  assign_post_creator(@post, creator)
end
