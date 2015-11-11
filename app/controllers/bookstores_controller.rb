class BookstoresController < ApplicationController
  skip_before_action :verify_authenticity_token
  include BookstoresHelper

  def new
  	@bookstore = Bookstore.new
  	@bookstores = Bookstore.all
  end

  def create
  	@bookstore = Bookstore.create(bookstore_params)
		redirect_to root_path
  end

  def map
    if !params[:lat].nil? && !params[:lng].nil?
      puts params[:lat]
      puts params[:lng]
      gon.test = false
      lat = params[:lat]
      lng = params[:lng]
    end

    @book_stores = find_stores(lat, lng)
    @libs = find_libs(lat, lng)
    @location = params[:choice_location]
    @bookstores = Bookstore.all
    @hash = Gmaps4rails.build_markers(@bookstores) do |bookstore, marker|
      marker.lat(bookstore.latitude)
      marker.lng(bookstore.longitude)
      marker.infowindow(bookstore.description)
    end
    puts params[:lat]
    puts params[:lng]
  end

  private

  def bookstore_params
      params.require(:bookstore).permit(:description, :name, :address)
  end

end
