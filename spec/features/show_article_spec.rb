require "rails_helper"

RSpec.feature "Showing an Articles" do 

	before do
		@article = Article.create(title: 'Title Content', body: 'Body Content')
	end

	scenario "A user show the article" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(page.current_path).to eq(article_path(@article))
	end
end