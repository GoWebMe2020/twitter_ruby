require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/tweet.rb'

class Twitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions, :method_override

  get '/' do
    @tweets = Tweet.all
    erb :index
  end

  get '/tweet/new' do
    erb :'tweet/new'
  end

  post '/tweets' do
    Tweet.create(tweet: params[:tweet])
    redirect '/'
  end

  delete '/tweets/:id' do
    Tweet.delete(id: params['id'])
    redirect '/'
  end

  run! if app_file == $0
end