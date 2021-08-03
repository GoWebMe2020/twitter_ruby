feature 'Adding a new tweet' do
  scenario 'A user can add a new tweet' do
    visit('/tweet/new')
    fill_in('tweet', with: 'This is a new Tweet')
    click_button('Submit')

    expect(page).to have_content('This is a new Tweet')
  end
end