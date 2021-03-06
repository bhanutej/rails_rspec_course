require "rails_helper"

RSpec.feature "Delete an article" do
	before do
		user = User.create!(email: 'user1@gmail.com', password: 'password')
		login_as(user)
		@article = Article.create(title: "Title", body: "Article body content", user: user)
	end

	scenario "A user deleting an article" do
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end
end
