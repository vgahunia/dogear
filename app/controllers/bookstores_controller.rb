class BookstoresController < ApplicationController

  def new
  	@bookstore = Bookstore.new

  	@bookstores = Bookstore.all
  end

  def create
  	@bookstore = Bookstore.create(bookstore_params)
		redirect_to root_path
  end

  private

  def bookstore_params
      params.require(:bookstore).permit(:description, :name, :address)
  end

end
