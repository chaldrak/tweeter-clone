class PostsController < ApplicationController


  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    render "index" if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
