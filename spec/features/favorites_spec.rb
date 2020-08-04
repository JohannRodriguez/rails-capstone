require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Favorites', type: :feature do
  before(:all) do
    User.new(name: 'Evelynn').save
    Article.new(author_id: 1, title: 'Article 1', text: 'Body article text', image: 'image_url').save
  end

  let(:article) { Article.all.first }
  let(:user) { User.all.first }

  context 'User loged' do
    before(:each) do
      visit new_session_path
      fill_in 'session_name', with: 'Evelynn'
      find("input[type='submit']").click
    end

    it 'Ensures article is added to your favorites' do
      visit article_path(id: article.id)
      find(class: 'favorite_highlight').click
      expect(page).to have_content('Article added to your favorites')
    end

    it 'Ensures article is removed to your favorites' do
      SaveArticle.new(user_id: user.id, article_id: article.id).save
      visit article_path(id: article.id)
      find(class: 'favorite_shadow').click
      expect(page).to have_content('Article removed from favorites')
    end

    it 'Ensures vote is added to article' do
      visit article_path(id: article.id)
      find(class: 'vote_highlight').click
      expect(page).to have_content('Vote recorded')
    end

    it 'Ensures vote is removed from article' do
      Vote.new(user_id: user.id, article_id: article.id).save
      visit article_path(id: article.id)
      find(class: 'vote_shadow').click
      expect(page).to have_content('Vote removed')
    end
  end

  context 'No user loged' do
    it 'Ensures redirect to login when no loged user tries to vote' do
      visit article_path(id: article.id)
      find(class: 'vote_highlight').click
      expect(page).to have_current_path(new_session_path)
    end

    it 'Ensures redirect to login when no loged user tries to vote' do
      visit article_path(id: article.id)
      find(class: 'favorite_highlight').click
      expect(page).to have_current_path(new_session_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
