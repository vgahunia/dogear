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

  def find_coordinates(lat=nil, lng=nil)
    puts "SO CLOUDY"
    puts lat = params[:data_value1]
    puts lng = params[:data_value2]
    if !(lat && lng)
      respond_to do |format|
        format.js
      end
    else
      puts "LAT IS #{lat}"
      puts "LONG IS #{lng}"
      redirect_to map({lat:lat, lng:lng})
    end

    # lat, lng
    # render 'map'
  end

  def map (options={})
    puts "======================"
    @lat = options[:lat]
    @lng = options[:lng]
    puts "MAP WITH #{options[:lat]} AND #{options[:lng]}"

    if options
      puts "LAT IS: #{@lat} and LONG IS: #{@lng}"
      @book_stores = find_stores(@lat, @lng)
      @libs = find_libs(@lat, @lng)
      @location = params[:choice_location]
      @bookstores = Bookstore.all
      @hash = Gmaps4rails.build_markers(@bookstores) do |bookstore, marker|
        marker.lat(bookstore.latitude)
        marker.lng(bookstore.longitude)
        marker.infowindow(bookstore.description)
      end
      # redirect_to map_path
    end
    # render 'map'
  end

  private

  def bookstore_params
    params.require(:bookstore).permit(:description, :name, :address)
  end

end
