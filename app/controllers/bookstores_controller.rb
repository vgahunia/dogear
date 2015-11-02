class BookstoresController < ApplicationController

  def new
  	@bookstore = Bookstore.new

  	@bookstores = Bookstore.all
  end

  def create
  	@bookstore = Bookstore.create(bookstore_params)
		redirect_to root_path
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

  private

  def bookstore_params
      params.require(:bookstore).permit(:description, :name, :address)
  end

end
