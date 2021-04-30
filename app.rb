require "sinatra/base"
require "sinatra/reloader"
require "sinatra/flash"
require "./lib/accommodation"
require "./lib/user"
require "./lib/booking"
require "./database_connection_setup"

class MakersBnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  before do
    @current_user = session[:user_id]
  end

  get '/' do
    erb(:home)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup/new' do
    user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/accommodations'
  end

  get '/login' do
    erb(:login)
  end

  post '/login/new' do
    logger = User.authenticate(username: params[:username],
                               password: params[:password])
    if logger
      session[:user_id] = logger.id
      redirect '/accommodations'
    else
      redirect '/login'
    end
  end

  get '/accommodations' do
    @user = User.find(id: session[:user_id])
    @accommodations = Accommodation.all
    erb(:accommodations)
  end

  post '/accommodations/add' do
    Accommodation.add(title: params[:title], price: params[:price],
                      description: params[:description], user_id: @current_user)
    redirect '/accommodations'
  end

  get '/accommodations/:id/bookings' do
    @booking_cart = []
    @booking_cart << Accommodation.find(id: params[:id])
    @host_name = Accommodation.find(id: params[:id])
    erb(:bookings)
  end


  post "/accommodations/:id/bookings/new" do
    @booking = Booking.create(date: params[:date], host_id: params[:id], tenant_id: @current_user)
    @user_booked = User.find(id: session[:user_id])
    erb(:confirmation)
  end

  post "/accommodations/logout" do 
    session[:user_id] = nil
    redirect "/"
  end

  run! if app_file == $PROGRAM_NAME

end
