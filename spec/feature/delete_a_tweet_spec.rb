feature 'Delete a tweet' do
  scenario 'A user can delete a tweet' do
    Tweet.create(tweet: 'This tweet should be deleted')
    visit('/')
    expect(page).to have_content('This tweet should be deleted')

    first('.tweet').click_button('Delete')

    expect(current_path).to eq('/')
    expect(page).not_to have_content('This tweet should be deleted')
  end
end