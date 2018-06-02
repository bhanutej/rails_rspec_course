require "rails_helper"

RSpec.feature "Sign out the loged in user" do
	before do
		@user = User.create!(email: 'user1@example.in', password: 'password')

		visit "/"
		click_link "Sign in"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Log in"
	end

	scenario "Sign out the user" do
		visit "/"
		click_link "Sign out"

		expect(page).to have_content("Signed out successfully.")
		expect(page).not_to have_link("Sign out")
	end
end
