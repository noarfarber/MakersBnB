feature 'Create button' do
  scenario 'should appear when you get to accommodations' do
    visit '/'
    click_button('View accommodations')
    expect(current_path).to eq '/accommodations'
    expect(page).to have_button 'Create'
  end
end

feature 'The user' do
  scenario 'should be able to create a new accommodation' do
    visit '/accommodations'
    fill_in("title", with: "Beach house")
    fill_in("description", with: "A nice house by the beach")
    fill_in("price", with: 69)
    click_button("Create")
    expect(page).to have_content("Beach house")
    expect(page).to have_content("A nice house by the beach for £69")
  end
end