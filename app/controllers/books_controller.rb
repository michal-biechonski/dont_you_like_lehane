# HANDLE ALL BOOKS WRITTEN BY LEHANE
class BooksController < ApplicationController
  expose :books, -> { Book.all }
  expose :book

  # before_action :set_user, only: %i[edit update destroy]
  before_action :set_reader, only: [:show]
  before_action :set_future_reader, only: [:show]
  # before_action only: %i[show edit update destroy] do
  #   set_book('book')
  # end
  # before_action :set_book, only: %i[show edit update destroy]

  def new
    authorize book
  end

  # POST /books
  def create
    authorize book
    if book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book
    else
      render :new
    end
  end

  def edit
    authorize book
  end

  def update
    authorize book
    if book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book
    else
      render :edit
    end
  end

  def destroy
    authorize book
    book.destroy
    flash[:notice] = 'Book was successfully deleted.'
    redirect_to books_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_book
  #   @book = Book.find(params[:id])
  # end

  # Never trust parameters from the internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :description, :picture, :published_at)
  end
end
