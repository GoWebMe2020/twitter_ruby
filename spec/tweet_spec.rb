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

describe '.delete' do
  it 'deletes the given tweet' do
    tweet = Tweet.create(tweet: 'This tweet must be deleted')

    Tweet.delete(id: tweet.id)

    expect(Tweet.all.length).to eq(0)
  end
end

describe '.update' do
  it 'updates a given tweet' do
    tweet = Tweet.create(tweet: 'This tweet must be edited')
    updated_tweet = Tweet.update(id: tweet.id, tweet: "This tweet is edited")

    expect(updated_tweet).to be_a(Tweet)
    expect(updated_tweet.id).to eq(tweet.id)
    expect(updated_tweet.tweet).to eq('This tweet is edited')
  end
end

describe '.find' do
  it 'returns the requested tweet as an object' do
    tweet = Tweet.create(tweet: 'This tweet must be found')

    result = Tweet.find(id: tweet.id)

    expect(result).to be_a(Tweet)
    expect(result.id).to eq(tweet.id)
    expect(result.tweet).to eq('This tweet must be found')
  end
end