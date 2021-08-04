require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/tweet.rb'
require_relative './lib/comment.rb'
require_relative './database_connection_setup.rb'

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

  get '/tweets/:id/edit' do
    # @tweet_id = params[:id]
    @tweet = Tweet.find(id: params[:id])
    erb :'tweet/edit'
  end

  patch '/tweets/:id' do
    Tweet.update(id: params[:id], tweet: params[:tweet])
    redirect '/'
  end

  get '/tweets/:id/comments/new' do
    @tweet_id = params[:id]
    erb :'comments/new'
  end

  post '/tweets/:id/comments' do
    # connection = SQLite3::Database.new "twitter_test.db"
    # connection.execute("INSERT INTO comments (comment, tweet_id) VALUES('#{params[:comment]}', '#{params[:id]}');")
    Comment.create(comment: params[:comment], tweet_id: params[:id])
    redirect '/'
  end

  run! if app_file == $0
end