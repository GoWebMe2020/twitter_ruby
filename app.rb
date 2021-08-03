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

  get '/tweet/new' do
    erb :'tweet/new'
  end

  post '/tweets' do
    # tweet = params['tweet']
    # connection = SQLite3::Database.new "twitter_test.db"
    # connection.execute("INSERT INTO tweets (tweet) VALUES ('#{tweet}'');")
    Tweet.create(tweet: params[:tweet])
    redirect '/'
  end

  run! if app_file == $0
end