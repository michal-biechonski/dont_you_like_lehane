class ReadersController < ApplicationController
  
  before_action :set_book, only: [:create, :destroy]
  before_action :set_future_reader, only: [:create, :destroy]

  def create
    @reader = current_user.readers.build()
    @reader.book_id = @book.id
    respond_to do |format|
      if @reader.save
        format.js {}
        format.html {
        flash[:notice] = "You've read this book!"
        redirect_to @book
      }
      else
        flash[:alert] = "You've already selected that book"
        redirect_to @book
      end
      unless @fut_reader.nil?
        @fut_reader.destroy
      end
    end
  end

  def destroy
    @reader = Reader.where("user_id = ? AND book_id = ?", current_user.id, @book.id).take
    if @reader.destroy
      flash[:notice] = "So you haven't read it yet??"
      redirect_to @book
    end
  end




    private

      def set_book
        @book = Book.find(params[:book_id])
      end

end
