require "rails_helper"

RSpec.feature "User Signup" do

	scenario "User valid signup" do
		visit "/"

		click_link "Sign up"
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "Password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign up"
	end

	scenario "User invalid signup" do
		visit "/"

		click_link "Sign up"
		fill_in "Email", with: ""
		fill_in "Password", with: ""
		fill_in "Password confirmation", with: ""
		click_button "Sign up"

		# expect(page).to have_content("You have not signed up successfully.")
		expect(page).to have_content("Email can't be blank")
		expect(page).to have_content("Password can't be blank")
	end
end