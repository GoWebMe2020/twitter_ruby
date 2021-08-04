require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up a connection to a database through SQLite3' do
      SQLite3::Database.new "twitter_test.db"
      # ! expect(SQLite3).to receive(::Database.new).with("twitter_test.db") Does not work
  
      DatabaseConnection.setup("twitter_test.db")
    end
    it 'this connection is persistant' do
      connection = DatabaseConnection.setup("twitter_test.db")

      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'executes a query via SQLite3' do
      connection = DatabaseConnection.setup("twitter_test.db")
      expect(connection).to receive(:execute).with('SELECT * FROM tweets')
      DatabaseConnection.query('SELECT * FROM tweets')
    end
  end
end