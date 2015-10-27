class BooksController < ApplicationController

  def new
    
  end

  def index
    @book = params[:choice]
    book_match = []
    client = Goodreads.new
    @books = client.search_books(@book)
  end

  def show
  end

end
