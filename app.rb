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

  get '/signup' do
    erb(:signup)
  end

  post '/signup/new' do 
   @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
   redirect '/accommodations'
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
    erb(:bookings)
  end

  run! if app_file == $0
end
