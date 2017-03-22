class FutureReadersController < ApplicationController

  before_action :set_book, only: [:create]

  def create
    @future_reader = current_user.future_readers.build()
    @future_reader.book_id = @book.id
    @future_reader.save
    flash[:notice] = "Done"
    redirect_to @book
  end




  private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def future_readers_params
      params.require(:future_reader).permit(:book_id)
    end



end
