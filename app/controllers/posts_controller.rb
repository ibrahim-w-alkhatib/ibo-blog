class PostsController < ApplicationController
  def index
    render inertia: "Posts/Index", props: {
      posts: Post.where(published: true).order(created_at: :desc)
    }
  end
end
