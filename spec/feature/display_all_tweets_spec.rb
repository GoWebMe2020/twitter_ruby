require 'sqlite3'

feature 'Viewing Tweets' do
  scenario 'visiting the index page will display all tweets' do
    Tweet.create(tweet: 'This is test tweet 1')
    Tweet.create(tweet: 'This is test tweet 2')
    Tweet.create(tweet: 'This is test tweet 3')

    visit('/')

    expect(page).to have_content("This is test tweet 1")
    expect(page).to have_content("This is test tweet 2")
    expect(page).to have_content("This is test tweet 3")
  end
end