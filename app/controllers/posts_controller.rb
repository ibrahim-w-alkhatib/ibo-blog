class PostsController < ApplicationController
  def index
    render inertia: "Posts/Index", props: {
      posts: Post.where(published: true).order(created_at: :desc)
    }
  end

  def show
    post = Post.find(params[:id])
    render inertia: "Posts/Show", props: {
      post: post
    }
  end
end
