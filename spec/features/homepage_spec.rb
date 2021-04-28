feature "Sign up button" do
  scenario "sign up should appear on the homepage" do
  visit '/'
  expect(page).to have_button("Sign up")
  end
end

feature "Takes you to signup page" do
  scenario "goes to signup page" do 
    visit '/'
    click_button "Sign up"
    expect(current_path).to eq "/signup"
    expect(page).to have_content("Name")
    expect(page).to have_content("Username")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Create user")
  end
end