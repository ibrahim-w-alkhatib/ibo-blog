class PagesController < ApplicationController
  def home
    render inertia: "Home", props: {
      posts: Post.where(published: true)
    }
  end
end
