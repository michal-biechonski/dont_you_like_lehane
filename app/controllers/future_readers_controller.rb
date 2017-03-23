class FutureReadersController < ApplicationController

  before_action :set_book, only: [:create, :destroy]
  before_action :set_reader, only: [:create, :destroy]

  def create
    @future_reader = current_user.future_readers.build()
    @future_reader.book_id = @book.id
    if @future_reader.save
      flash[:notice] = "You've added this book to your wishlist!"
      unless @exist_reader.nil?
        @exist_reader.destroy
      end
      redirect_to @book
    else
      flash[:alert] = "You can only add this book once."
      redirect_to @book
    end
  end

  def destroy
    @future_reader = FutureReader.where("user_id = ? AND book_id = ?", current_user.id, @book.id).take
    if @future_reader.destroy
      flash[:notice] = "So you don't wanna read it??"
      redirect_to @book
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
