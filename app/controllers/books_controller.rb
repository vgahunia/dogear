class BooksController < ApplicationController
  include SessionsHelper

  def new
    @bookstore = Bookstore.new
  end

  def index
    current_user
    client = Goodreads.new
    @client = client

    @book = params[:choice_title]
    @books = client.search_books(@book)
    @book_list = []

    @books.results.work.each {|book|
      if Book.find_by(gr_id: book.best_book.id)
        b = Book.find_by(gr_id: book.best_book.id)
      else
        b = Book.create({
        title: book.best_book.title,
        author: book.best_book.author.name, 
        year: book.original_publication_year, 
        image_url: book.best_book.image_url,
        gr_id: book.best_book.id
        })
      end
    @book_list << b
  }
  end

  def share
    puts "SHARING BOOK"

    user = User.find(params[:user_id])
    book = Book.find(params[:book_id])

    unless user.hated_books.include?(book)
      puts "ADDING BOOK"
      user.favorite_books << book
      flash[:success] = "Your book was added"
      redirect_to :back
    else
      flash[:danger] = "You have already stated that you could not finish this book."
      @switch = false
      redirect_to :back
    end
  end

  def dislike
    puts "DISLIKING BOOK"

    user = User.find(params[:user_id])
    book = Book.find(params[:book_id])

    unless user.favorite_books.include?(book)
      puts "HATING BOOK"
      user.hated_books << book
      flash[:success] = "Your book was added"
      redirect_to :back
    else
      flash[:danger] = "You have already listed this book as a favorite."
      @switch = false
      redirect_to :back
    end
  end

  def store
    @bookstore = Bookstore.create(bookstore_params)
    redirect_to root_path
  end

  def show
  end

  

end
