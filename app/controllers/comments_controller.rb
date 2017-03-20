class CommentsController < ApplicationController
  
  before_action :user_signed_in?
  before_action :set_book, only: [:new, :create]
  before_action :same_user, only: [:delete]

  def new
    @comment = @book.comments.new
  end

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    flash[:notice] = "Comment was added"
    redirect_to @book
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was deleted"
    redirect_to @book
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def same_user
      return false unless current_user.id == @comment.user_id
    end
end
