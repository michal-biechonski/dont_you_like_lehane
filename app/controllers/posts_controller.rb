# HANDLE POSTS CREATED ETC BY USERS
class PostsController < ApplicationController
  expose :posts, -> { Post.all }
  expose :post
  # before_action :set_user, only: %i[new create edit update destroy]
  # before_action :set_post, only: %i[show edit update destroy]
  # before_action only: %i[edit update destroy] do
  #   same_user(@post)
  # end

  def index
  end

  def show; end

  # FIXME: add post authorization => different user can't change another users posts etc
  def new
    authorize post, policy_class: PostPolicy
  end

  def edit
    authorize post, policy_class: PostPolicy
  end

  def create
    authorize post, policy_class: PostPolicy
    post.user = current_user
    if post.save
      flash[:notice] = 'You\'ve created a post.'
      redirect_to current_user
    else
      render 'new'
    end
  end

  def update
    authorize post, policy_class: PostPolicy
    if post.update(post_params)
      flash[:notice] = "You've updated your post."
      redirect_to current_user
    else
      render "edit"
    end
  end

  def destroy
    authorize post, policy_class: PostPolicy
    post.destroy
    flash[:notice] = "You've deleted that post."
    redirect_to current_user
  end

  private

  # def set_post
  #   @post = Post.find(params[:id])
  # end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  # def user_not_authorized(custom_msg = nil)
  #   super('You can only do this to your own posts!')
  # end
end
