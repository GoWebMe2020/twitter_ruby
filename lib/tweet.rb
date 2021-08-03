require 'sqlite3'

class Tweet

  attr_reader :id, :tweet

  def initialize(id:, tweet:)
    @id = id
    @tweet = tweet
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = SQLite3::Database.new "twitter_test.db"
    else
      connection = SQLite3::Database.new "twitter.db"
    end
    result = connection.execute('SELECT * FROM tweets')
    result.map do |db_tweet|
      Tweet.new(id: db_tweet[0], tweet: db_tweet[1])
    end
  end

  def self.create(tweet:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = SQLite3::Database.new "twitter_test.db"
    else
      connection = SQLite3::Database.new "twitter.db"
    end
    result = connection.execute("INSERT INTO tweets (tweet) VALUES ('#{tweet}') RETURNING id, tweet;")
    Tweet.new(
      id: result[0][0], 
      tweet: result[0][1]
    )
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = SQLite3::Database.new "twitter_test.db"
    else
      connection = SQLite3::Database.new "twitter.db"
    end
    connection.execute("DELETE FROM tweets WHERE id = #{id}")
  end

end