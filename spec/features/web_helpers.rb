# frozen_string_literal: true

def sign_up_create_user_visit_accommodations
  visit '/signup'
  click_button('Create user')
  visit '/accommodations'
end

def visit_home_sign_up
  visit '/'
  click_button 'Sign up'
end

def sign_up_create_user_visit_accommodations_select
  visit '/signup'
  click_button('Create user')
  visit '/accommodations'
  click_button('Select')
end
