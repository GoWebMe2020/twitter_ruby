require_relative 'database_connection'
require_relative './comment.rb'

class Tweet

  attr_reader :id, :tweet

  def initialize(id:, tweet:)
    @id = id
    @tweet = tweet
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM tweets')
    result.map do |db_tweet|
      Tweet.new(id: db_tweet[0], tweet: db_tweet[1])
    end
  end

  def self.create(tweet:)
    result = DatabaseConnection.query("INSERT INTO tweets (tweet) VALUES ('#{tweet}') RETURNING id, tweet;")
    Tweet.new(
      id: result[0][0], 
      tweet: result[0][1]
    )
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM tweets WHERE id = #{id}")
  end

  def self.update(id:, tweet:)
    result = DatabaseConnection.query("UPDATE tweets SET tweet = '#{tweet}' WHERE id = '#{id}' RETURNING id, tweet;")
    Tweet.new(
      id: result[0][0], 
      tweet: result[0][1]
    )
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM tweets WHERE id = #{id};")
    Tweet.new(
      id: result[0][0], 
      tweet: result[0][1]
    )
  end

  def comments(comment_class = Comment)
    # DatabaseConnection.query("SELECT * FROM comments WHERE tweet_id = #{id};")
    comment_class.where(tweet_id: id)
  end

end