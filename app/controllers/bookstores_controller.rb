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
    puts "======================"
    puts params[:data_value1]
    puts params[:data_value2]
    lat = params[:data_value1]
    lng = params[:data_value2]
    @book_stores = find_stores(lat, lng)
    @libs = find_libs(lat, lng)
    @location = params[:choice_location]
    @bookstores = Bookstore.all
    @hash = Gmaps4rails.build_markers(@bookstores) do |bookstore, marker|
      marker.lat(bookstore.latitude)
      marker.lng(bookstore.longitude)
      marker.infowindow(bookstore.description)
    end
    # respond_to do |format|
    #     format.js   {}
    # end
  end

  private

  def bookstore_params
      params.require(:bookstore).permit(:description, :name, :address)
  end

end
