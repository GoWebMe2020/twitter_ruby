feature 'Updating a Tweet' do
  scenario 'A user can update a tweet' do
    tweet = Tweet.create(tweet: 'This tweet should be edited')
    visit('/')
    expect(page).to have_content('This tweet should be edited')

    first('.tweet').click_button('Edit')
    expect(current_path).to eq("/tweets/#{tweet.id}/edit")

    fill_in('tweet', with: 'This tweet has been edited')
    click_button('Submit')
    
    expect(current_path).to eq('/')
    expect(page).not_to have_content('This tweet should be edited')
    expect(page).to have_content('This tweet has been edited')
  end
end