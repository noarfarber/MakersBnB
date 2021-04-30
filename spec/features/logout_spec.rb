feature "Logout of session" do
  scenario "should send the user to the homepage" do
    sign_up_create_user_visit_accommodations
    click_button("Logout")
    expect(current_path).to eq "/"
  end
end
