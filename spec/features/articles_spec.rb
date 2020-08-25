require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Articles', type: :feature do
  let(:article) { Article.where(title: 'Catplant article').all.first }
  let(:weird_category) { Category.where(name: 'The weird category').all.first }

  before(:all) do
    Article.new(author_id: 1, title: 'Catplant article', text: 'Catplant text', image: 'image_url').save
    Category.new(name: 'The weird category', priority: 1).save
  end

  before(:each) do
    visit new_session_path
    fill_in 'session_name', with: 'Evelynn'
    find("input[type='submit']").click
  end

  it 'Ensures redirect when article is deleted' do
    visit article_path(id: article.id)
    click_link('Delete article')
    expect(page).to have_content('Article deleted')
  end

  it 'Ensures category is added to article' do
    visit article_path(id: article.id)
    click_link(weird_category.name)
    expect(page).to have_content('Category succesfully added to your article')
  end

  it 'Ensures redirect when article is deleted' do
    visit edit_article_path(id: article.id)
    fill_in 'article_title', with: 'New article title'
    find("input[type='submit']").click
    expect(page).to have_content('Article succesfully updated')
  end

  it 'Ensures user can not edit without proper title' do
    visit edit_article_path(id: article.id)
    fill_in 'article_title', with: '123'
    find("input[type='submit']").click
    expect(page).to have_content('Invalid fields')
  end

  it 'Ensures user can not edit without proper text' do
    visit edit_article_path(id: article.id)
    fill_in 'article_text', with: ''
    find("input[type='submit']").click
    expect(page).to have_content('Invalid fields')
  end

  it 'Ensures user can not edit without image' do
    visit edit_article_path(id: article.id)
    fill_in 'article_text', with: ''
    find("input[type='submit']").click
    expect(page).to have_content('Invalid fields')
  end
end
# rubocop:enable Metrics/BlockLength
