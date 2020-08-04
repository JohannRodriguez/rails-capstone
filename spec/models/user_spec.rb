require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  it 'Ensures name presence' do
    expect(user.valid?).to eq(false)
  end

  it 'Ensures name' do
    user.name = 'Sophia'
    expect(user.valid?).to eq(true)
  end

  it 'Ensures name uniqueness' do
    User.new(name: 'Evelynn').save
    user.name = 'Evelynn'
    expect(user.valid?).to eq(false)
  end

  it 'Ensures name length bigger than two' do
    user.name = 'Ed'
    expect(user.valid?).to eq(false)
  end

  it 'Ensures name length smaller than ten' do
    user.name = 'Johann Sebastian Bach'
    expect(user.valid?).to eq(false)
  end
end
