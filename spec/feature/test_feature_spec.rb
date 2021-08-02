feature 'Visiting Twitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content('Twitter')
  end
end