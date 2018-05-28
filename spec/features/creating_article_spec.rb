require "rails_helper"

RSpec.feature "Creating Articles" do 
	scenario "A user creates a new article" do 
		visit "/"
		click_link "New Article"
		fill_in "Title", with: "Creating a blog"
		fill_in "Body", with: "Lorum Ipsum"
		click_button "Create Article"
		expect(page).to have_content("Article has been created")
		expect(page.curent_path).to eq(articles_path) 
	end
end
