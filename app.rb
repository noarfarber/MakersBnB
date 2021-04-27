require "sinatra/base"
require "sinatra/reloader"
require "./lib/accommodation"
require "./database_connection_setup"

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:home)
  end

  get "/accommodations" do
    @accommodations = Accommodation.all
    erb(:accommodations)
  end

  post "/accommodations/add" do
    Accommodation.add(title: params[:title], price: params[:price], description: params[:description])
    redirect "/accommodations"
  end

  get "/accommodations/:id/bookings" do
    @booking_cart = []
    @booking_cart << Accommodation.find(id: params[:id])
    p @booking_cart
    erb(:bookings)
  end

  run! if app_file == $0
end
