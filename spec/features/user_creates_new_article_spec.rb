require 'rails_helper'

  describe "user creates a new article" do
    describe "they link from the articles index" do
      describe "they fill in a title and body"
        it "creates a new article" do
          visit articles_path
          click_link "Create a New Article"

          expect(current_path).to eq(new_article_path)

          fill_in "article[title]", with: "New Title!"
          fill_in "article[body]", with: "New Body!"
          click_on "Create Article"

          expect(page).to have_content("New Title!")
          expect(page).to have_content("New Body!")
        end
      end
    end


describe "user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)
    end
  end
end
