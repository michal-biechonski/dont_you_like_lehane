class PagesController < ApplicationController

  def about
  end

  def contact
  end

  def home
    @books = Book.first(3)
  end

end
