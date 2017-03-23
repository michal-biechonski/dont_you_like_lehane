class ReadersController < ApplicationController
  
  before_action :set_book, only: [:create]

  def create
    @reader = current_user.readers.build()
    @reader.book_id = @book.id
    if @reader.save
      flash[:notice] = "You've read this book!"
      redirect_to @book
    else
      flash[:alert] = "You've already selected that book"
      redirect_to @book
    end
  end

  def destroy
    @reader = Reader.find_by(user_id: current_user.id).where(book_id: @book.id)
    flash[:notice] = "So you haven't read it yet??"
    redirect_to @book
  end




    private

      def set_book
        @book = Book.find(params[:book_id])
      end
end
