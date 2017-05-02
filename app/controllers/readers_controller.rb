# HANDLE USERS WHO READ SPECIFIC BOOKS
class ReadersController < ApplicationController
  before_action :set_book, only: %i[create show destroy]
  before_action :set_future_reader, only: %i[create show destroy]
  before_action :set_user, only: %i[create show destroy]

  def create
    @reader = current_user.readers.build
    @reader.book_id = @book.id
    respond_to do |format|
      if @reader.save
        unless @fut_reader.nil?
          @fut_reader.destroy
        end
        format.js
        format.html do
          flash[:notice] = "You've read this book!"
          redirect_to @book
        end
      else
        format.html do
          flash[:alert] = "You've already selected that book"
          redirect_to @book
        end
      end
    end
  end

  def show
    destroy
  end

  def destroy
    @reader = Reader.where('user_id = ? AND book_id = ?',
                           current_user.id, @book.id).take
    respond_to do |format|
      if !@reader.nil? && @reader.destroy
        format.js
        format.html do
          flash[:notice] = "So you haven't read it yet??"
          redirect_to @book
        end
      else
        format.html do
          flash[:alert] = "You haven't read that book!"
          redirect_to @book
        end
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
