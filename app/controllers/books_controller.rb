class BooksController < ApplicationController

  def new
    @bookstore = Bookstore.new
  end

  def index
    client = Goodreads.new
    @client = client

    @book = params[:choice_title]
    @books = client.search_books(@book)
  end

  def map
    @location = params[:choice_location]
    @bookstores = Bookstore.all
    @hash = Gmaps4rails.build_markers(@bookstores) do |bookstore, marker|
      marker.lat(bookstore.latitude)
      marker.lng(bookstore.longitude)
      marker.infowindow(bookstore.description)
    end
  end

  def store
    @bookstore = Bookstore.create(bookstore_params)
    redirect_to root_path
  end

  def show
  end

  

end
