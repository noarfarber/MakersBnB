# feature 'Confirmation page' do
#   scenario 'a user confirms their booking' do
#     host = User.create(name: "alfie", username: "the_dog", email: "alfie@gmail.com" , password: "12345")
#     accommodation = Accommodation.add(title: "beautiful house", price: 400, description: "amazing", user_id: host.id)
#     tenant = User.create(name: "duckie", username: "the_duck", email: "duckie@gmail.com" , password: "123456")
#     visit "/accommodations/#{accommodation.id}/bookings"
#     accommodations_fill_in_date_book
#     expect(page).to have_content "Pack your bags the_duck!"
#   end
# end

# feature 'Date of stay is confirmed for the user' do
#   scenario 'the user sees their booking date details confirmed' do
#     host = User.create(name: "alfie", username: "the_dog", email: "alfie@gmail.com" , password: "12345")
#     accommodation = Accommodation.add(title: "beautiful house", price: 400, description: "amazing", user_id: host.id)
#     visit "/accommodations/#{accommodation.id}/bookings"
#     accommodations_fill_in_date_book
#     expect(page).to have_content "Your stay is booked for 2021-04-28"
#   end
# end
