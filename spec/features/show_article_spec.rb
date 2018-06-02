require "rails_helper"

RSpec.feature "Showing an Articles" do 

	before do
		@user1 = User.create!(email: 'user1@gmail.com', password: 'password')
		@user2 = User.create!(email: 'user2@gmail.com', password: 'password')
		@article = Article.create(title: 'Title Content', body: 'Body Content', user: @user1)
	end

	scenario "A non signed in user to hide edit and delete buttons" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(page.current_path).to eq(article_path(@article))
		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end

	scenario "A non owner in user to hide edit and delete buttons" do
		login_as(@user2)
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(page.current_path).to eq(article_path(@article))
		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end
end