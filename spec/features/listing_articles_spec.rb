require "rails_helper"

RSpec.feature "Listing Articles" do 

	before do 
		@article1 = Article.create(title: 'Title1', body: 'Title1 body content')
		@article2 = Article.create(title: 'Title2', body: 'Title2 body content')
	end

	scenario "A user listing articles" do
		visit "/"

		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(page).to have_content(@article2.title)
		expect(page).to have_content(@article2.body)
		expect(page).to have_link(@article1.title)
		expect(page).to have_link(@article2.title)
	end

end
