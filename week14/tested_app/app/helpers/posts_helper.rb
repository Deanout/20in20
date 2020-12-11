module PostsHelper
  def assign_post_creator(post, creator)
    post.user = creator
    post
  end
end
