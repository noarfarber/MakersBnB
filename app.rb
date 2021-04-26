require "sinatra/base"
require "sinatra/reloader"

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:home)
  end

  run! if app_file == $0
end
