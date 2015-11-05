class BooksController < ApplicationController
  include SessionsHelper

  def new
    @bookstore = Bookstore.new
  end

  def index
    if @user
      @user = User.find(params[:id])
    end
    
    client = Goodreads.new
    @client = client

    @book = params[:choice_title]
    @books = client.search_books(@book)
  end

  def store
    @bookstore = Bookstore.create(bookstore_params)
    redirect_to root_path
  end

  def show
  end

  

end
