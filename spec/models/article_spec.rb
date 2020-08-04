require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { Article.new }

  it 'Ensures article author presence' do
    article.valid?
    expect(article.errors[:author]).to include('must exist')
  end

  it 'Ensures article title presence' do
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end

  it 'Ensures article text presence' do
    article.valid?
    expect(article.errors[:text]).to include("can't be blank")
  end

  it 'Ensures article image presence' do
    article.valid?
    expect(article.errors[:image]).to include("can't be blank")
  end

  it 'Ensures article title uniqueness' do
    Article.new(title: 'Example title').save
    article.title = 'Example title'
    expect(article.valid?).to eq(false)
  end

  it 'Ensures article title length bigger than four' do
    article.title = 'Tile'
    expect(article.valid?).to eq(false)
  end

  it 'Ensures article title length smaller than fiftysix' do
    article.title = 'This is a ver very long title to test the rspec'
    expect(article.valid?).to eq(false)
  end

  it 'Ensures article text to be smaller than four thousand' do
    sample_text = ''
    400.times do
      sample_text + '12345678910'
    end
    article.text = sample_text
    expect(article.valid?).to eq(false)
  end
end
