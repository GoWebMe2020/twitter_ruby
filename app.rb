require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/cross_origin'
require_relative './lib/tweet.rb'
require_relative './lib/comment.rb'
require_relative './database_connection_setup.rb'

class Twitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  set :bind, '0.0.0.0' # ! Cross Origin

  configure do
    enable :cross_origin # ! Cross Origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*' # ! Cross Origin
  end

  get '/' do
    # @tweets = Tweet.all
    # erb :index
    # ? Everything below this line is meant to be REACT

    @tweets = Tweet.all.map do |tweet|
                { :id => tweet.id, :tweet => tweet.tweet }
              end

    content_type :json

    { data: @tweets }.to_json
  end

  get '/tweet/new' do
    erb :'tweet/new'
  end

  post '/tweets' do
    Tweet.create(tweet: params[:tweet])
    p params
    redirect 'http://127.0.0.1:3000/'
  end

  delete '/tweets/:id' do
    Tweet.delete(id: params['id'])
    redirect '/'
  end

  get '/tweets/:id/edit' do
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
    Comment.create(comment: params[:comment], tweet_id: params[:id])
    redirect '/'
  end

  options "*" do
    response.headers["Allow"] = "get, post, delete, patch, options"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  run! if app_file == $0
end

