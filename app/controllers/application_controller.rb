# APPLICATION CONTROLLER
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include BooksHelper
  include DeviseHelper
end
