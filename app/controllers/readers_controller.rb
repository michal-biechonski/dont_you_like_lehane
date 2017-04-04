class ReadersController < ApplicationController
  
  before_action :set_book, only: [:create, :destroy]
  before_action :set_future_reader, only: [:create, :destroy]

  def create
    @reader = current_user.readers.build()
    @reader.book_id = @book.id
    respond_to do |format|
      if @reader.save
        unless @fut_reader.nil?
          @fut_reader.destroy
        end
        format.js
        format.html {
        flash[:notice] = "You've read this book!"
        redirect_to @book
      }
      else
        format.html {
          flash[:alert] = "You've already selected that book"
          redirect_to @book
        }
      end
    end
  end

  def destroy
    @reader = Reader.where("user_id = ? AND book_id = ?", current_user.id, @book.id).take
    respond_to do |format|
      if @reader.destroy
        format.js
        format.html {
          flash[:notice] = "So you haven't read it yet??"
          redirect_to @book         
        }
      end
    end
  end




    private

      def set_book
        @book = Book.find(params[:book_id])
      end

end
