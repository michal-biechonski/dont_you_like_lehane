class ReadersController < ApplicationController
  
  before_action :set_book, only: [:create]

  def create
    @reader = current_user.readers.build()
    @reader.book_id = @book.id
    @reader.save
    flash[:notice] = "Great"
    redirect_to @book
  end




    private

      def set_book
        @book = Book.find(params[:book_id])
      end
end
