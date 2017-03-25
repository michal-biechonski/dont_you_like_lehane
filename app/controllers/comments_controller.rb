class CommentsController < ApplicationController
  
  before_action :user_signed_in?
  before_action :set_book, only: [:new, :create]
  before_action :set_comment, only: [:destroy]
  before_action :same_user, only: [:destroy]

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
    @comment.destroy
    flash[:notice] = "Comment was deleted"
    redirect_to(:back)
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def same_user
      unless current_user.id == @comment.user_id
        return false
      end
      return false unless current_user.id == @comment.user_id
    end
end
