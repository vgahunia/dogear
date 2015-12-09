class BookstoresController < ApplicationController
  skip_before_action :verify_authenticity_token
  include BookstoresHelper
  # respond_to :js, :html

  def new
  	@bookstore = Bookstore.new
  	@bookstores = Bookstore.all
  end

  def create
  	@bookstore = Bookstore.create(bookstore_params)
    redirect_to root_path
  end

  # def find_coordinates(lat=nil, lng=nil)
  # #   puts "SO CLOUDY"
  #   puts lat = params[:data_value1]
  #   puts lng = params[:data_value2]
  #   if !(lat && lng)
  #     respond_to do |format|
  #       format.js
  #     end
  #   else
  #     puts "LAT IS #{lat}"
  #     puts "LONG IS #{lng}"
  #     map({lat:lat, lng:lng})
  #     # render map({lat:lat, lng:lng})
  #   end
  # end

  def map (options={})

    puts "======================"

    @lat = params[:data_value1]
    @lng = params[:data_value2]

    if (@lat && @lng)
      puts "WE HAVE VALUES %%%%%%%%%%%%%%%%%%%%%%%%"


      puts "MAP WITH #{options[:lat]} AND #{options[:lng]}"

      puts "LAT IS: #{@lat} and LONG IS: #{@lng}"
      @book_stores = find_stores(@lat, @lng)
      @libs = find_libs(@lat, @lng)
      @location = params[:choice_location]
      @bookstores = Bookstore.all
      puts "HASHHHHHHHHHHHHH"
      @hash = Gmaps4rails.build_markers(@bookstores) do |bookstore, marker|
        marker.lat(bookstore.latitude)
        marker.lng(bookstore.longitude)
        marker.infowindow(bookstore.description)
      end

      respond_to do |format|
        # format.html
        format.js
      end

    else
      puts "NO VALUES YET **************************"
      redirect_to root_path
    end
      # redirect_to map_path
    end

    private

    def bookstore_params
      params.require(:bookstore).permit(:description, :name, :address)
    end

  end
