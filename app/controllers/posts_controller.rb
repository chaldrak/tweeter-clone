class PostsController < ApplicationController

  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    render "index" if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render "index"
    else
      if @post.save
        redirect_to posts_path, notice: "Tweet créé !!!"
      else
        render :index
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
