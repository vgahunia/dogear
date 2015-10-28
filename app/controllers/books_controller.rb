class BooksController < ApplicationController

  def new
    
  end

  def index
    client = Goodreads.new
    @client = client

    @book = params[:choice_title]
    @books = client.search_books(@book)
  end

  def map
    @location = params[:choice_location]
  end

  def show
  end

end
