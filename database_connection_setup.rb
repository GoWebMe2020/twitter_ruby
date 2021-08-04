require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  connection = DatabaseConnection.setup("twitter_test.db")
else
  connection = DatabaseConnection.setup("twitter.db")
end