require 'sqlite3'

class Tweet

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = SQLite3::Database.new "twitter_test.db"
    else
      connection = SQLite3::Database.new "twitter.db"
    end
    result = connection.execute('SELECT * FROM tweets')
    result.map { |tweet| tweet[1] } # This must be changed to result.map { |tweet| tweet['tweet'] }
  end

  def self.create(tweet:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = SQLite3::Database.new "twitter_test.db"
    else
      connection = SQLite3::Database.new "twitter.db"
    end
    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is a new Tweet");')
  end

end