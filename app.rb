require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/tweet.rb'

class Twitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @tweets = Tweet.all
    erb :index
  end

  run! if app_file == $0
end