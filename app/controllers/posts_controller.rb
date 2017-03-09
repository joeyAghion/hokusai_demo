class PostsController < ApplicationController
  def index
    @posts = Post.all.order('id DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params.require(:post).permit(:title, :subtitle, :thumbnail_url, :body))
    redirect_to action: 'index'
  end
end
