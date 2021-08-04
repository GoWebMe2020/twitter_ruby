feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a tweet' do
      tweet = Tweet.create(tweet: 'Comment on this tweet')

      visit('/')
      first('.tweet').click_button('Add Comment')

      expect(current_path).to eq("/tweets/#{tweet.id}/comments/new")

      fill_in 'comment', with: 'This is a comment'
      click_button('Submit')

      expect(current_path).to eq('/')
      expect(first('.comment')).to have_content('This is a comment')
    end
  end
end