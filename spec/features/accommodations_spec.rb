# frozen_string_literal: true

feature 'Create button' do
  scenario 'should appear when you get to accommodations' do
    visit '/'
    click_button('Sign up')
    click_button('Create user')
    expect(current_path).to eq '/accommodations'
    expect(page).to have_button 'Create'
  end
end

feature 'The user' do
  scenario 'should be able to create a new accommodation' do
    sign_up_create_user_visit_accommodations
    fill_in('title', with: 'Beach house')
    fill_in('description', with: 'A nice house by the beach')
    fill_in('price', with: 69)
    click_button('Create')
    expect(page).to have_content('Beach house')
    expect(page).to have_content('A nice house by the beach for £69')
  end
end

feature 'List all accommodation' do
  scenario 'the user wants to see all listings' do
    mj = User.create(name: "Jesus", username: "Allah", email: "god@email.com", password: "passgod")
    loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: mj.id)
    visit "/accommodations"
    expect(page).to have_content("#{loft.title}")
    expect(page).to have_content("#{loft.price}")
    expect(page).to have_content("#{loft.description}")
  end
end

feature 'Create select button' do
  scenario 'should appear on the page accommodations' do
    mj = User.create(name: 'Jesus', username: 'Allah', email: 'god@email.com', password: 'passgod')
    loft = Accommodation.add(title: 'Lazy Loft', price: 100, description: 'It is lazy', user_id: mj.id)
    # Lint/UselessAssignment: Useless assignment to variable - loft?
    sign_up_create_user_visit_accommodations
    expect(page).to have_button('Select')
  end
end

feature 'Clicking in select' do
  scenario 'should select the given accommodation and get the user to bookings page' do
    mj = User.create(name: "Jesus", username: "Allah", email: "god@email.com", password: "passgod")
    loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: mj.id)
    sign_up_create_user_visit_accommodations
    click_button('Select')
    expect(current_path).to eq "/accommodations/#{loft.id}/bookings"
    expect(page).to have_content(loft.title.to_s)
  end
end
