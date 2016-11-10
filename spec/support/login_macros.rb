  def signin(user)
    visit root_url
    click_link "Admin"

    fill_in "email", with: "admin@example.com"
    fill_in "password", with: "secret12345"

    click_button "Sign in"
  end
