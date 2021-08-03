require 'tweet'

describe '.all' do
  it 'returns a list of tweets' do
    connection = SQLite3::Database.new "twitter_test.db"

    tweet = Tweet.create(tweet:'This is test tweet 1')
    Tweet.create(tweet:'This is test tweet 2')
    Tweet.create(tweet:'This is test tweet 3')
    
    tweets = Tweet.all

    expect(tweets.length).to eq(3)
    expect(tweets.first).to be_a(Tweet) 
    expect(tweets.first.id).to eq(tweet.id)
    expect(tweets.first.tweet).to eq('This is test tweet 1')
  end
end

describe '.create' do
  it 'creates a new tweet' do
    tweet = Tweet.create(tweet: 'This is a new Tweet')
    persisted_data = SQLite3::Database.new "twitter_test.db"
    tweets = persisted_data.execute("SELECT * FROM tweets WHERE id = #{tweet.id};")

    expect(tweet).to be_a(Tweet) 
    expect(tweet.id).to eq(tweets.first[0])
    expect(tweet.tweet).to eq('This is a new Tweet')
  end
end