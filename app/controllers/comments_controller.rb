# HANDLE ALL COMMENTS FROM USERS
class CommentsController < ApplicationController
  expose :comment
  expose :book
  # before_action :set_user
  # before_action :set_book, only: %i[new create destroy]
  # before_action only: %i[new create destroy] do
  #   set_book("comment")
  # end
  # before_action :set_comment, only: [:destroy]
  # before_action only: [:destroy] do
  #   same_user(@comment)
  # end

  def new
    authorize comment
    comment = book.comments.build
  end

  def create
    authorize comment
    comment = book.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      flash[:notice] = "Comment was successfully added."
      redirect_to book
    else
      render "new"
    end
  end

  def destroy
    authorize comment
    comment.destroy
    flash[:notice] = "Comment was successfully deleted."
    redirect_to comment.book
  end

  private

  # def set_book
  #   @book = Book.find(params[:book_id])
  # end

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
