def sign_up_create_user_visit_accommodations
  visit "/signup"
  click_button("Create user")
  visit "/accommodations"
end

def visit_home_sign_up
  visit '/'
  click_button "Sign up"
end

def sign_up_create_user_visit_accommodations_select
  visit "/signup"
  click_button("Create user")
  visit "/accommodations"
  click_button("Select")
end 

def user_create_accommodation_add
  mj = User.create(name: "Jesus", username: "Allah", email: "god@email.com", password: "passgod")
  loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: mj.id)
end