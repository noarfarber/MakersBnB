feature "sign up page" do
  it "allows a new user to sign up" do
    visit_home_sign_up
    fill_in("name", with: "Dominic")
    fill_in("username", with: "thedom")
    fill_in("email", with: "dom@gmail.com")
    fill_in("password", with: "okdom234")
    click_button("Create user")
    expect(page).to have_content "thedom"
  end
end
