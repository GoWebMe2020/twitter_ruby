require 'sqlite3'

def setup_test_database
  p "Setting up database..."
  connection = SQLite3::Database.new "twitter_test.db"
  connection.execute('DELETE FROM tweets;')
  connection.execute('DELETE FROM comments')
end
