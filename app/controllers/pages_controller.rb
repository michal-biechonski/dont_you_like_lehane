# Pages controller
class PagesController < ApplicationController
  before_action :set_body_classes

  def about; end

  def contact; end

  def home
    @books = Book.first(3)
  end

  private

  def set_body_classes
    @body_classes = 'body__pages'
  end
end
