require 'sinatra/base'
require 'sinatra/reloader'

class Twitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Twitter"
  end

  run! if app_file == $0
end