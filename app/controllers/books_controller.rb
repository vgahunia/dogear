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
    @book_list = []

    @books.results.work.each {|book| @book_list << Book.create({
      title: book.best_book.title,
      author: book.best_book.author.name, 
      year: book.original_publication_year, 
      image_url: book.best_book.image_url
    })
  }

  end

  def store
    @bookstore = Bookstore.create(bookstore_params)
    redirect_to root_path
  end

  def show
  end

  

end
