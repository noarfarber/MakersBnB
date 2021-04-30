# frozen_string_literal: true

feature 'The login page' do
  scenario 'should show a username and password field and Button' do
    visit '/'
    click_button('Login')
    expect(current_path).to eq '/login'
    expect(page).to have_content('Username:')
    expect(page).to have_button('Go')
  end
end
