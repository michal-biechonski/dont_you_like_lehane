# HANDLE POSTS CREATED ETC BY USERS
class PostsController < ApplicationController
  before_action :set_user, only: %i[new create edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action only: %i[edit update destroy] do
    same_user(@post)
  end

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = @user.posts.build
  end

  def edit; end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:notice] = "You've created a post."
      redirect_to @user
    else
      render "new"
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "You've updated your post."
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "You've deleted that post."
    redirect_to @user
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
