class PostsController < ApplicationController
  
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = @user.posts.build
  end

  def edit
  end

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

    def set_user
      if current_user
        @user = current_user
      else
        flash[:alert] = "You have to be logged in to do that!"
        redirect_to new_user_session_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
