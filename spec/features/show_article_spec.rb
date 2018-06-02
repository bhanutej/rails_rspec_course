require "rails_helper"

RSpec.feature "Showing an Articles" do 

	before do
		user = User.create!(email: 'user1@gmail.com', password: 'password')
		login_as(user)
		@article = Article.create(title: 'Title Content', body: 'Body Content', user: user)
	end

	scenario "A user show the article" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(page.current_path).to eq(article_path(@article))
	end
end