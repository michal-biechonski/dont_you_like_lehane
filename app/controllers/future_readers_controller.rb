# HANDLE USERS ON THE WISHLIST
class FutureReadersController < ApplicationController
  before_action :set_book, only: %i[create show destroy]
  before_action :set_reader, only: %i[create show destroy]
  before_action :set_user, only: %i[create show destroy]

  def create
    @future_reader = current_user.future_readers.build
    @future_reader.book_id = @book.id
    respond_to do |format|
      if @future_reader.save
        unless @exist_reader.nil?
          @exist_reader.destroy
        end
        format.js
        format.html do
          flash[:notice] = 'You\'ve added this book to your wishlist!'
          redirect_to @book
        end
      else
        format.html do
          flash[:alert] = 'You can only add this book once.'
          redirect_to @book
        end
      end
    end
  end

  def show
    destroy
  end

  def destroy
    @future_reader = FutureReader.where('user_id = ? AND book_id = ?',
                                        current_user.id, @book.id).take
    respond_to do |format|
      if !@future_reader.nil? && @future_reader.destroy
        format.js
        format.html do
          flash[:notice] = 'So you don\'t wanna read it??'
          redirect_to @book
        end
      else
        format.html do
          flash[:notice] = 'You haven\'t added it to the wishlist!'
          redirect_to @book
        end
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def future_readers_params
    params.require(:future_reader).permit(:book_id)
  end
end
