require 'sqlite3'

feature 'Viewing Tweets' do
  scenario 'visiting the index page will display all tweets' do
    connection = SQLite3::Database.new "twitter_test.db"

    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is test tweet 1");')
    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is test tweet 2");')
    connection.execute('INSERT INTO tweets (tweet) VALUES ("This is test tweet 3");')

    visit('/')

    expect(page).to have_content("This is test tweet 1")
    expect(page).to have_content("This is test tweet 2")
    expect(page).to have_content("This is test tweet 3")
  end
  
end