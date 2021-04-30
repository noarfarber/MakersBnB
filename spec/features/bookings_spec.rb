feature 'the bookings page' do
  scenario 'the user sees the relevant booking info once selecting' do
    host = User.create(name: "Julie", username: "mother_julie", email: "julie@gmail.com" , password: "sami34")
    accommodation = Accommodation.add(title: "Stylish city apartment", price: 125, description: "Perfect city stay", user_id: host.id)
    visit "/accommodations/#{accommodation.id}/bookings"
    expect(page).to have_content(accommodation.title)
    expect(page).to have_content(accommodation.id)
    expect(page).to have_content(accommodation.description)
    expect(page).to have_content(accommodation.price)
    expect(page).to have_field("date")
  end
end
