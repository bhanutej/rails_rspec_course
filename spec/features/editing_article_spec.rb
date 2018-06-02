require "rails_helper"

RSpec.feature "Editing an Articles" do
	before do
		user = User.create!(email: 'user1@gmail.com', password: 'password')
		login_as(user)
		@article = Article.create(title: 'Title Content', body: 'Body Content', user: user)
	end

	scenario "A user updates an article" do
		visit "/"

		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with: "Editing an article title"
		fill_in "Body", with: "Editing an article body"
		click_button "Update Article"

		expect(page).to have_content("Article has been updated")
		expect(page.current_path).to eq(article_path(@article)) 
	end

	scenario "A user failed to updates an article" do
		visit "/"

		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with: ""
		fill_in "Body", with: "Editing an article body"
		click_button "Update Article"

		expect(page).to have_content("Article has not been updated")
		expect(page).to have_content("Title can't be blank")
		expect(page.current_path).to eq(article_path(@article)) 
	end
end