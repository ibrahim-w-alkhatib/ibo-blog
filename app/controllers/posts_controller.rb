class PostsController < ApplicationController
  def index
    posts = Post.order(created_at: :desc)

    if params[:search].present?
      posts = posts.where("title LIKE ?", "%#{params[:search]}%")
    end

    if params[:status] == "published"
      posts = posts.where(published: true)
    elsif params[:status] == "draft"
      posts = posts.where(published: false)
    end

    render inertia: "Posts/Index", props: {
      posts: posts,
      filters: {
        search: params[:search] || "",
        status: params[:status] || "all"
      }
    }
  end

  def show
    post = Post.find(params[:id])
    render inertia: "Posts/Show", props: {
      post: post.as_json.merge(body_html: post.body_html)
    }
  end

  def new
    render inertia: "Posts/New"
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post, notice: "Post created successfully."
    else
      redirect_back fallback_location: new_post_path, errors: post.errors
    end
  end

  def edit
    post = Post.find(params[:id])
    render inertia: "Posts/Edit", props: {
      post: post
    }
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post, notice: "Post updated successfully."
    else
      redirect_back fallback_location: edit_post_path(post), errors: post.errors
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path, notice: "Post deleted successfully."
  end

    private

  def post_params
    params.require(:post).permit(:title, :body, :published)
  end
end
