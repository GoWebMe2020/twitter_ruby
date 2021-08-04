require 'sqlite3'

class DatabaseConnection

  attr_reader :connection

  def self.setup(dbname)
    @connection = SQLite3::Database.new dbname
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.execute(sql)
  end

end