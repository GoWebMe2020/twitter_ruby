require 'tweet'

describe '.all' do
  it 'returns a list of tweets' do
    # In IRB, perform the following function to return all tweets
      # require 'sqlite3'
      # connection = SQLite3::Database.new "twitter.db" - Connects to the database
      # INSERT INTO tweets (tweet) VALUES ("This is test tweet 1"); - x3 to add tweets
      # result = connection.execute('SELECT * FROM tweets')
    connection = SQLite3::Database.new "twitter_test.db"

    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is test tweet 1");')
    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is test tweet 2");')
    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is test tweet 3");')
    
    @tweets = Tweet.all

    expect(@tweets).to include("This is test tweet 1")
    expect(@tweets).to include("This is test tweet 2")
    expect(@tweets).to include("This is test tweet 3")
  end
end

describe '.create' do
  it 'creates a new tweet' do
    Tweet.create(tweet: 'This is a new Tweet')

    expect(Tweet.all).to include('This is a new Tweet')
  end
end