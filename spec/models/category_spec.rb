require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Ensures uniqueness of category' do
    category = Category.new
    Category.new(name: 'category name').save
    category.name = 'category name'
    expect(category.valid?).to eq(false)
  end
end
