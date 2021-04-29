feature 'Confirmation page' do
  scenario 'a user confirms their booking' do
    host = User.create(name: "alfie", username: "the_dog", email: "alfie@gmail.com" , password: "12345")
    accommodation = Accommodation.add(title: "beautiful house", price: 400, description: "amazing", user_id: host.id)
    tenant = User.create(name: "duckie", username: "the_duck", email: "duckie@gmail.com" , password: "123456")
    sign_up_create_user_visit_accommodations_select
    fill_in("date", with: "28/04/2021")
    click_button("Book")
    expect(page).to have_content "Pack your bags #{tenant.username}!"
    #visit 
  end
end
